require 'rails_helper'

describe Api::ApartmentsController, type: :controller do
  let!(:ap_title)     { FactoryBot.create(:apartment, title: 'Brand new sunny apartment') }
  let!(:ap_price_min) { FactoryBot.create(:apartment, price: 250000) }
  let!(:ap_price_max) { FactoryBot.create(:apartment, price: 80000) }
  let!(:ap_sqm_min)   { FactoryBot.create(:apartment, sqm: 70.34) }
  let!(:ap_sqm_max)   { FactoryBot.create(:apartment, sqm: 40.18) }
  let!(:ap_bedrooms)  { FactoryBot.create(:apartment, bedrooms: 4) }
  let!(:ap_bathrooms) { FactoryBot.create(:apartment, bathrooms: 2) }

  context '#filter' do
    let(:parse) { ->(resp) { JSON.parse(resp.body) } }
  
    context 'by title' do
      before do
        get :filter, params: { title: 'sunny' }
      end

      it 'returns apartments filtered' do
        expect(parse[response].first['id']).to eq(ap_title.id)
      end
    end

    context 'by price_min' do
      before do
        get :filter, params: { price_min: 200000 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_price_min.id)
      end
    end

    context 'by price_max' do
      before do
        get :filter, params: { price_max: 100000 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_price_max.id)
      end
    end

    context 'by sqm_min' do
      before do
        get :filter, params: { sqm_min: 70.01 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_sqm_min.id)
      end
    end

    context 'by sqm_max' do
      before do
        get :filter, params: { sqm_max: 40.50 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_sqm_max.id)
      end
    end

    context 'by bedrooms' do
      before do
        get :filter, params: { bedrooms: 4 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_bedrooms.id)
      end
    end

    context 'by bathrooms' do
      before do
        get :filter, params: { bathrooms: 2 }
      end

      it 'returns apartments filtered' do
        expect(parse[response].count).to eq(1)
        expect(parse[response].first['id']).to eq(ap_bathrooms.id)
      end
    end
  end
end
