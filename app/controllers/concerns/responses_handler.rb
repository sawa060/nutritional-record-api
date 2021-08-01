module ResponsesHandler
  private

  def response200(class_name = controller_name, method_name = action_name, option_data: {})
    base_body = { status: 200, message: "OK #{class_name.classify} #{method_name.classify}" }
    render status: :ok, json: base_body.merge(option_data)
  end

  def response201(class_name = controller_name, option_data: {})
    base_body = { status: 201, message: "Created #{class_name.classify}" }
    render status: :created, json: base_body.merge(option_data)
  end

  def response400(option_data: {})
    base_body = { status: 400, message: 'Bad Request' }
    render status: :bad_request, json: base_body.merge(option_data)
  end

  def response401(option_data: {})
    base_body = { status: 401, message: 'Unauthorized' }
    render status: :unauthorized, json: base_body.merge(option_data)
  end

  def response403(option_data: {})
    base_body = { status: 403, message: 'Forbidden' }
    render status: :forbidden, json: base_body.merge(option_data)
  end

  def response404(class_name = nil, option_data: {})
    class_message = class_name.present? ? "#{class_name.classify} " : ''
    base_body = { status: 404, message: "#{class_message}Not Found" }
    render status: :not_found, json: base_body.merge(option_data)
  end

  def response422(option_data: {})
    base_body = { status: 422, message: 'Unprocessable Entity' }
    render status: :unprocessable_entity, json: base_body.merge(option_data)
  end

  def response500(option_data: {})
    base_body = { status: 500, message: 'Internal Server Error' }
    render status: :internal_server_error, json: base_body.merge(option_data)
  end

  def response400_with_error(details)
    response400(option_data: { errors: details })
  end

  def response401_with_error(msg)
    response401(option_data: { errors: msg })
  end

  def response422_with_error(details)
    response422(option_data: { errors: details })
  end
end
