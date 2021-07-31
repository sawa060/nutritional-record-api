class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Rails.application.routes.url_helpers

  class << self
    def fields_for_fetch(fields: nil, only: nil, except: nil)
      column_names = self.column_names.map(&:to_sym)
      column_names |= self::CUSTOM_FIELDS if defined?(self::CUSTOM_FIELDS)
      column_names &= only if only
      column_names -= except if except
      return column_names if fields.nil?

      column_names & fields.split(',').map(&:to_sym)
    end

    def enum_options_for_select(attr_name)
      send(attr_name.to_s.pluralize).map { |k, _| [Libs::I18n.t_enum!(attr_name, k), k] }.to_h
    end

    def translate_enum_value(data)
      data.map do |k, v| # i18nに基づいてenum変換
        if respond_to?(k.to_s.pluralize) # enumが定義されてるか
          dictionary = enum_options_for_select(k)
          data[k] = dictionary[v]
        end
      end
    end

    def translate_boolean_value(data)
      data.map do |attr_name, v|
        if columns_hash[attr_name.to_s].type == :boolean
          dictionary = [[Libs::I18n.t_boolean!(attr_name, true), true], [Libs::I18n.t_boolean!(attr_name, false), false]].to_h
          data[attr_name] = dictionary[v]
        end
      end
    end
  end

  scope :pager, ->(params) {
    relation = self
    relation = relation.limit(params[:limit]) if params[:limit]
    relation = relation.offset(params[:offset]) if params[:offset]
    relation
  }
end
