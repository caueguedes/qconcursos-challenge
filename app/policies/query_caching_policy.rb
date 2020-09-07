class QueryCachingPolicy
  MAXIMUM_PAGES = 10
  ALLOWED_PARAMS = %w( discipline period page)
  CACHING_TIME = 2.minutes

  def initialize(params:)
    @params = params
  end

  def caching_allowed?
    allowed_params? && page_number_allowed?
  end

  private
    def allowed_params?
      @params[:page].to_i <= MAXIMUM_PAGES
    end

    def page_number_allowed?
      @params.keys.all? { |key| ALLOWED_PARAMS.include?(key) }
    end
end
