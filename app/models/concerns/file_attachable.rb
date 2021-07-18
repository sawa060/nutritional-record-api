module FileAttachable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  IMAGE_EXTENSIONS = %i[jpeg jpg png gif bmp].freeze
  PDF_EXTENSIONS = %i[pdf].freeze
  OTHER_EXTENSIONS = %i[zip xls xlsx doc docx txt].freeze
  ALL_EXTENSIONS = (IMAGE_EXTENSIONS + PDF_EXTENSIONS + OTHER_EXTENSIONS).freeze
  ATTACHE_LIMIT = 10
  IMAGE_CAPACITY = 10.megabytes
  FILE_CAPACITY = 100.megabytes
  IMAGE_THUMB_DIMENSION = [316, 276].freeze # 158x138がグリッド形式のサムネイルのサイズなのでRetina対応を考慮して2倍設定
  IMAGE_ORIG_DIMENSION = [3456, 3018].freeze # 316x276の縦横比固定で800万画素程度の画像サイズ。JPGの最高品質で8.2MB程度
  PDF_EXTENSION = '.pdf'.freeze
  PDF_TYPE = 'application/pdf'.freeze

  class_methods do
    # 単数ファイル添付
    def file_attachable(*attrs)
      attrs.each do |attr|
        define_file_url(attr)
        define_file_thumb_url(attr)
        define_file_attach(attr)
        define_file_purge(attr)
      end
    end

    def define_file_url(attr)
      define_method("#{attr}_url") do
        file = public_send(attr)
        generate_file_url(file) if file.attached?
      end
    end

    def define_file_thumb_url(attr)
      define_method("#{attr}_thumb_url") do
        file = public_send(attr)
        generate_file_thumb_url(file) if file.image? && file.attached?
      end
    end

    def define_file_attach(attr)
      define_method("#{attr}_attach=") do |new_file|
        public_send(attr).attach(new_file) if new_file.present?
      end
    end

    def define_file_purge(attr)
      define_method("#{attr}_purge=") do |value|
        public_send(attr).purge_later if value.present?
      end
    end

    # 複数ファイル添付
    def files_attachable(*attrs)
      attrs.each do |attr|
        define_files_index(attr)
        define_files_attach(attr)
        define_files_apply_filename(attr)
        define_files_valid_filename(attr)
        define_files_accepts_nested(attr)
      end
    end

    def define_files_index(attr)
      define_method("#{attr}_index") do
        files = public_send(attr)
        files.map(&method(:generate_file_attr)) if files.attached?
      end
    end

    def define_files_attach(attr)
      define_method("#{attr}_attach=") do |new_files|
        files = public_send(attr)
        files.attach([*files.map(&:blob), *new_files])
      end
    end

    def define_files_apply_filename(attr)
      define_method("#{attr}_attachments_attributes=") do |attributes|
        files = public_send(attr)
        attributes = attributes.map { |attribute|
          next attribute unless (new_filename = attribute[:filename].presence)

          filename = files.find(attribute.fetch(:id)).filename
          attribute.merge(filename: new_filename + filename.extension_with_delimiter)
        }
        super(attributes)
      end
    end

    def define_files_valid_filename(attr)
      validate do |record|
        files = record.public_send(attr)
        files.each do |file|
          record.errors.add("#{attr}.filename", :blank) if file.filename.to_s.blank?
        end
      end
    end

    def define_files_accepts_nested(attr)
      accepts_nested_attributes_for "#{attr}_attachments".to_sym, allow_destroy: true
    end
  end

  private

  def attach_clone_file(method, from)
    to_file = public_send(method)
    from_file = from.public_send(method)
    to_file.attach(from_file.blob)
  end

  def attach_clone_files(method, from)
    to_files = public_send(method)
    from_files = from.public_send(method)
    to_files.attach(from_files.map(&:blob))
  end

  def generate_file_attr(file)
    file_attr = { id: file.id, filename: file.filename.base, extension: file.filename.extension, url: generate_file_url(file) }
    return file_attr unless file.image?

    file_attr.merge(thumb_url: generate_file_thumb_url(file))
  end

  def generate_file_url(file)
    if file.image?
      url_for(file.variant(resize_to_limit: IMAGE_ORIG_DIMENSION))
    else
      rails_blob_url(file)
    end
  end

  def generate_file_thumb_url(file)
    url_for(file.variant(resize_to_limit: IMAGE_THUMB_DIMENSION))
  end
end
