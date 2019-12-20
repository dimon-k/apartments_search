require 'rails_helper'

describe Api::ApartmentsController, type: :controller do
  let!(:ap_title)     { FactoryBot.create(:apartment, title: 'Brand new sunny apartment') }
  let!(:ap_price_min) { FactoryBot.create(:apartment, price: 250000) }
  let!(:ap_price_max) { FactoryBot.create(:apartment, price: 80000) }
  let!(:ap_sqm_min)   { FactoryBot.create(:apartment, sqm: 70.34) }
  let!(:ap_sqm_max)   { FactoryBot.create(:apartment, sqm: 40.18) }
  let!(:ap_bedrooms)  { FactoryBot.create(:apartment, bedrooms: 4) }
  let!(:ap_bathrooms) { FactoryBot.create(:apartment, bathrooms: 2) }
  let!(:ap_madryd)    { FactoryBot.create(:apartment, latitude: 40.4167047, longitude: -3.7035825) }

  context '#filter' do
    let(:parse) { ->(resp) { JSON.parse(resp.body) } }
  
    context 'by location' do
      context 'Madryd' do
        before do
          get :filter, params: { location: 'Madryd' }
        end

        it 'returns apartments filtered' do
          expect(parse[response].count).to eq(1)
          expect(parse[response].first['id']).to eq(ap_madryd.id)
        end
      end

      context 'Barcelona' do
        before do
          get :filter, params: { location: 'Barcelona' }
        end

        it 'returns apartments filtered' do
          expect(parse[response].count).to eq(7)
        end
      end
    end

    context 'by price min' do
      before do
        get :filter, params: { q: { price_gteq: 200000 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_price_min.id)
      end
    end

    context 'by price max' do
      before do
        get :filter, params: { q: { price_lteq: 100000 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_price_max.id)
      end
    end

    context 'by sqm min' do
      before do
        get :filter, params: { q: { sqm_gteq: 70.01 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_sqm_min.id)
      end
    end

    context 'by sqm max' do
      before do
        get :filter, params: { q: { sqm_lteq: 40.50 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_sqm_max.id)
      end
    end

    context 'by bedrooms' do
      before do
        get :filter, params: { q: { bedrooms_eq: 4 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_bedrooms.id)
      end
    end

    context 'by bathrooms' do
      before do
        get :filter, params: { q: { bathrooms_eq: 2 } }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_bathrooms.id)
      end
    end
  end
end
