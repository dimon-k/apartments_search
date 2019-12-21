require 'rails_helper'

feature 'filter on front end', js: true do
  let!(:ap_price_min) { FactoryBot.create(:apartment, title: 'ap_price_min', price: 250000) }
  let!(:ap_price_max) { FactoryBot.create(:apartment, title: 'ap_price_max', price: 80000) }
  let!(:ap_sqm_min)   { FactoryBot.create(:apartment, title: 'ap_sqm_min',   sqm: 70.34) }
  let!(:ap_sqm_max)   { FactoryBot.create(:apartment, title: 'ap_sqm_max',   sqm: 40.18) }
  let!(:ap_bedrooms)  { FactoryBot.create(:apartment, title: 'ap_bedrooms',  bedrooms: 4) }
  let!(:ap_bathrooms) { FactoryBot.create(:apartment, title: 'ap_bathrooms', bathrooms: 2) }
  let!(:ap_madryd)    { FactoryBot.create(:apartment, title: 'ap_madryd',    latitude: 40.4167047, longitude: -3.7035825) }

  before do
    visit '/'
  end

  describe 'by location' do
    describe 'Madryd' do
      scenario 'works the same as api on back end' do
        fill_in 'locations', with: 'Madryd'
        click_on(class: 'search-magnifier')
        expect(page).to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end

    describe 'Barcelona' do
      scenario 'works the same as api on back end' do
        fill_in 'locations', with: 'Barcelona'
        click_on(class: 'search-magnifier')
        expect(page).not_to have_content('ap_madryd')
        expect(page).to have_content('ap_price_min')
        expect(page).to have_content('ap_price_max')
        expect(page).to have_content('ap_sqm_min')
        expect(page).to have_content('ap_sqm_max')
        expect(page).to have_content('ap_bedrooms')
        expect(page).to have_content('ap_bathrooms')
      end
    end
  end

  describe 'by price' do
    before do
      find('.filters-button-wrapper').click
    end
  
    describe 'min' do
      scenario 'works the same as api on back end' do
        fill_in 'priceMin', with: '200000'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end

    describe 'max' do
      scenario 'works the same as api on back end' do
        fill_in 'priceMax', with: '100000'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end
  end

  describe 'by sqm' do
    before do
      find('.filters-button-wrapper').click
    end
  
    describe 'min' do
      scenario 'works the same as api on back end' do
        fill_in 'sqmMin', with: '70,01'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end

    describe 'max' do
      scenario 'works the same as api on back end' do
        fill_in 'sqmMax', with: '40,50'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end
  end

  describe 'by rooms' do
    before do
      find('.filters-button-wrapper').click
    end

    describe 'bedrooms' do
      scenario 'works the same as api on back end' do
        fill_in 'numberOfBedrooms', with: '4'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).to have_content('ap_bedrooms')
        expect(page).not_to have_content('ap_bathrooms')
      end
    end

    describe 'bathrooms' do
      scenario 'works the same as api on back end' do
        fill_in 'numberOfBathrooms', with: '2'
        click_button 'APPLY'
        expect(page).not_to have_content('ap_madryd')
        expect(page).not_to have_content('ap_price_min')
        expect(page).not_to have_content('ap_price_max')
        expect(page).not_to have_content('ap_sqm_min')
        expect(page).not_to have_content('ap_sqm_max')
        expect(page).not_to have_content('ap_bedrooms')
        expect(page).to have_content('ap_bathrooms')
      end
    end
  end
end
