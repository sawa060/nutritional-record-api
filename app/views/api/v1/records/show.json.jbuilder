json.extract! @record, *Record.fields_for_fetch(fields: params[:fields])
