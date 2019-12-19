module Api
  class ApartmentsController < ActionController::API
    def filter
      apartments = Apartment.all
      apartments = apartments.where('LOWER(title) LIKE ?', "%#{apartment_params[:title].downcase}%") if apartment_params[:title].present?
      apartments = apartments.where('price >= ?', "#{apartment_params[:price_min]}") if apartment_params[:price_min].present?
      apartments = apartments.where('price <= ?', "#{apartment_params[:price_max]}") if apartment_params[:price_max].present?
      apartments = apartments.where('sqm >= ?', "#{apartment_params[:sqm_min]}") if apartment_params[:sqm_min].present?
      apartments = apartments.where('sqm <= ?', "#{apartment_params[:sqm_max]}") if apartment_params[:sqm_max].present?
      apartments = apartments.where(bedrooms: apartment_params[:bedrooms]) if apartment_params[:bedrooms].present?
      apartments = apartments.where(bathrooms: apartment_params[:bathrooms]) if apartment_params[:bathrooms].present?

      render json: apartments.sample(12)
    end

    private

    def apartment_params
      params.permit(:title, :price_min, :price_max, :sqm_min, :sqm_max, :bedrooms, :bathrooms)
    end
  end
end
