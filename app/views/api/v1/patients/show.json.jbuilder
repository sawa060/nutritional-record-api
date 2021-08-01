json.extract! @patient, *Patient.fields_for_fetch(fields: params[:fields])
