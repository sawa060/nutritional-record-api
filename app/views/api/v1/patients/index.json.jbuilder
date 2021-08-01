record_fields = Patient.fields_for_fetch(fields: params[:fields])

json.partial! partial: 'layouts/pager', records: @patients, total: @total, index: ->(records) {
  json.array! records do |record|
    json.extract! record, *record_fields
  end
}
