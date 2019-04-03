require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let!(:event) { create :event, name: 'Metallica' }

  describe 'GET #global' do
    it 'returns http success' do
      post :global, params: { search: { query: 'metallica' } }
      expect(response).to have_http_status(:success)
    end
  end
end
