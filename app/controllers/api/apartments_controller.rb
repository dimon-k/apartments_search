module Api
  class ApartmentsController < ActionController::API
    before_action :set_geo_scope, only: :filter

    def filter
      apartments = @search.ransack(params[:q]).result(distinct: true)

      render json: apartments.sample(12)
    end

    private

    def set_geo_scope
      @search = params[:location].present? ? Apartment.near_location(params[:location]) : Apartment.all
    end
  end
end
