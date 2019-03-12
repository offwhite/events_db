require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
  describe 'GET #show' do
    let(:venue) { create :venue }

    it 'returns http success' do
      get :show, params: { id: venue.id }
      expect(response).to have_http_status(:success)
    end
  end
end
