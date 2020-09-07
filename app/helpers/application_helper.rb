module ApplicationHelper
  def set_to_current_params(params)
    request.query_parameters.merge(params)
  end

  def pagination
    render partial:"layouts/pagination"
  end
end
