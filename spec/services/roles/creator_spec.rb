require 'rails_helper'
describe Roles::Creator do
  let(:creator) do
    described_class.new(params, user)
  end

  let!(:user) { create(:user) }
  let!(:profile) { create(:profile) }
  let!(:role_type) { create(:role_type) }
  let!(:event) { create(:event) }

  let(:params) do
    {
      profile_id: profile.id,
      role_type_id: role_type.id,
      event_id: event.id
    }
  end

  context 'with valid params' do
    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should create a new role' do
      expect { creator.call }.to change { Role.count }.by(1)
    end

    it 'should sets the params' do
      creator.call
      role = Role.last
      expect(role.profile).to eq profile
      expect(role.event).to eq event
      expect(role.role_type).to eq role_type
    end
  end

  context 'with duplicate params' do
    let!(:role) do
      create(
        :role,
        profile_id: profile.id,
        role_type_id: role_type.id,
        event_id: event.id,
        creator: user
      )
    end

    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should not create a new role' do
      expect { creator.call }.to change { Role.count }.by(0)
    end
  end
end
