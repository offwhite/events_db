require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  let!(:role) { create :role }

  context 'with no user' do
    describe 'GET #new' do
      it 'returns http redirect' do
        get :new
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context 'with user' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    context 'with regular perms' do
      let(:user) { create :user, permission_level: 1 }

      describe 'GET #edit' do
        it 'returns http redirect' do
          get :edit, params: { id: role.id }
          expect(response).to have_http_status(:redirect)
        end
      end

      describe 'POST #update' do
        it 'returns http redirect' do
          post :update, params: { id: role.id, role: { name: 'testing' } }
          expect(response).to have_http_status(:redirect)
        end
      end
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: role.id }
          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'with regular perms but created the role' do
      let(:user) { create :user, permission_level: 1 }
      let(:profile) { create :profile, user: user }
      let!(:role) { create :role, profile: profile }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: role.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
