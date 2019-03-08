require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:event) { create :event }

    it 'returns http success' do
      get :show, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    let(:event) { create :event }

    it 'returns http success' do
      get :edit, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end
end
