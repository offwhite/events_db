require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let!(:event) { create :event }

  describe 'GET #home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #sitemap' do
    it 'returns http redirect' do
      get :sitemap, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #terms' do
    it 'returns http redirect' do
      get :terms, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #privacy' do
    it 'returns http redirect' do
      get :privacy, params: { id: event.id }
      expect(response).to have_http_status(:success)
    end
  end
end
