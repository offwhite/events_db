require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
  let(:venue) { create :venue }
  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: venue.id, slug: 'slug' }
      expect(response).to have_http_status(:success)
    end
  end

  context 'with a user' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: venue.id }
          expect(response).to have_http_status(:success)
        end
      end

      describe 'GET #new' do
        it 'returns http success' do
          get :new, params: { id: venue.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
