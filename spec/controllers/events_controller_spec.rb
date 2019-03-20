require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:event) { create :event }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context 'with no user' do
    describe 'GET #edit' do
      it 'returns http redirect' do
        get :edit, params: { id: event.id }
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
          get :edit, params: { id: event.id }
          expect(response).to have_http_status(302)
        end
      end

      describe 'GET #new' do
        it 'returns http redirect' do
          get :new
          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: event.id }
          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'who owns this event' do
      let(:user) { create :user, permission_level: 2 }
      let!(:event) { create :event, user: user }

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit, params: { id: event.id }
          expect(response).to have_http_status(:success)
        end
      end

      describe 'POST #update' do
        it 'returns http redirect, creates a log and update event' do
          log_count = Log.count
          post :update, params: { id: event.id, event: { name: 'testing' } }
          expect(response).to have_http_status(302)
          expect(event.reload.name).to eq('testing')
          expect(Log.count).to eq(log_count + 1)
        end
      end
    end
  end
end
