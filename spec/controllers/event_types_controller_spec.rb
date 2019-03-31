require 'rails_helper'

RSpec.describe EventTypesController, type: :controller do
  let!(:event_type) { create :event_type }

  context 'with no user' do
    describe 'GET #edit' do
      it 'returns http redirect' do
        get :edit, params: { id: event_type.id }
        expect(response).to have_http_status(302)
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
        it 'returns http redirect' do
          get :edit, params: { id: event_type.id }
          expect(response).to have_http_status(302)
        end
      end

      describe 'GET #new' do
        it 'returns http redirect' do
          get :new, params: { id: event_type.id }
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: event_type.id }
          expect(response).to have_http_status(:success)
        end
      end

      describe 'GET #new' do
        it 'returns http success' do
          get :new, params: { id: event_type.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
