module Pagination
  extend ActiveSupport::Concern

  def set_paginate_params
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
  end

  private
    def paginate(relation)
      collection = relation.page(@page).per(@per_page)
      raise ActiveRecord::RecordNotFound.new('No Records Found') if collection.empty?
      collection
    end
end
