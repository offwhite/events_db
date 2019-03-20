require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  context 'without a user' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET #events' do
      it 'returns http redirect' do
        get :events
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'without a user with insufficient perms' do
    let(:user) { create :user, permission_level: 1 }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    describe 'GET #index' do
      it 'returns http redirect' do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET #events' do
      it 'returns http redirect' do
        get :events
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'with an admin user' do
    let(:user)        { create :user, permission_level: 3 }
    let!(:role)       { create :role }
    let!(:event)      { create :event }
    let!(:tour)       { create :tour }
    let!(:venue)      { create :venue }
    let!(:profile)    { create :profile }
    let!(:event_type) { create :event_type }
    let!(:role_type)  { create :role_type }
    let!(:department) { create :role_department }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #events' do
      it 'returns http success' do
        get :events
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #roles' do
      it 'returns http success' do
        get :roles
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #venues' do
      it 'returns http success' do
        get :venues
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #profiles' do
      it 'returns http success' do
        get :profiles
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #tours' do
      it 'returns http success' do
        get :tours
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #event_types' do
      it 'returns http success' do
        get :event_types
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #role_types' do
      it 'returns http success' do
        get :role_types
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #departments' do
      it 'returns http success' do
        get :departments
        expect(response).to have_http_status(:success)
      end
    end
  end
end
