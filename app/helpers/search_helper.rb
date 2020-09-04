module SearchHelper
  def set_current_params(period:)
    request.query_parameters.merge(period: period)
  end
end