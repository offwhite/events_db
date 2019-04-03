require 'rails_helper'

RSpec.describe RoleDepartmentsController, type: :controller do
  let!(:role_department) { create :role_department }

  describe 'GET #new' do
    it 'returns http error' do
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  context 'with a user' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    context 'with regular perms' do
      let(:user) { create :user, permission_level: 1 }

      describe 'GET #new' do
        it 'returns http error' do
          get :new
          expect(response).to have_http_status(:redirect)
        end
      end
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #new' do
        it 'returns http success' do
          get :new
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
