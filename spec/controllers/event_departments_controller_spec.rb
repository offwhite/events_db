require 'rails_helper'

RSpec.describe EventDepartmentsController, type: :controller do
  let!(:event_department) { create :event_department }
  let!(:event) { create :event, event_type: event_type }
  let!(:event_type) { create :event_type }

  context 'with no user' do
    describe 'GET #new' do
      it 'returns http redirect' do
        get :new, params: { id: event_department.id }
        expect(response).to have_http_status(:redirect)
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

      describe 'GET #new' do
        it 'returns http redirect' do
          get :new, params: { id: event_department.id }
          expect(response).to have_http_status(:redirect)
        end
      end
    end

    context 'with admin perms' do
      let(:user) { create :user, permission_level: 3 }

      describe 'GET #new' do
        it 'returns http success' do
          get :new, params: { id: event_department.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
