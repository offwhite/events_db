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

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    let(:user) { create :user, permission_level: 1 }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    let(:event) { create :event }

    it 'returns http success' do
      get :edit, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end
end
