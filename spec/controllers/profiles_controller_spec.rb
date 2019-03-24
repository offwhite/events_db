require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:profile) { create :profile }

  context 'with no user' do
    describe 'GET #home' do
      it 'returns http success' do
        get :home, params: { username: profile.username }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns http redirect to home' do
        get :show, params: { id: profile.id }
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET #edit' do
      it 'returns http redirect' do
        get :edit, params: { id: profile.id }
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET #lookup' do
      it 'returns http success' do
        post :lookup, params: { format: 'xhr' }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #claim' do
      it 'returns http success' do
        get :claim, params: { id: profile.id }
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'with a user' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    context 'with regular perms' do
      let(:user) { create :user, permission_level: 1 }

      describe 'GET #edit' do
        it 'returns http redirect to home' do
          get :edit, params: { id: profile.id }
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'with regular perms who owns the profile' do
      let(:user) { create :user, permission_level: 1 }
      let(:profile) { create :profile, user_id: user.id }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: profile.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
