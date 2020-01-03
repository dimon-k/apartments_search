module Api
  class ApartmentsController < ActionController::API
    def filter
      apartments = ApartmentsSearcher.new(apartments_params).search

      render json: apartments.sample(40),
             each_serializer: serializer
    end

    private

    def apartments_params
      params.permit(:price_gteq, :price_lteq, :sqm_gteq, :sqm_lteq,
                    :bedrooms_eq, :bathrooms_eq, :location)
    end

    def serializer
      ::ApartmentSerializer
    end
  end
end
