module ApplicationHelper
  def set_to_current_params(params)
    request.query_parameters.merge(params)
  end
end
