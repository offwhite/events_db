require 'rails_helper'
describe Profiles::RoleCreator do
  let(:creator) do
    described_class.new(params, event_id, profile, user)
  end

  let!(:event) { create(:event) }
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user_id: user.id) }
  let!(:venue) { create(:venue) }
  let!(:role_type) { create(:role_type) }
  let!(:event_type) { create(:event_type) }
  let(:event_id) { nil }

  let(:params) do
    {
      role_type_id: role_type.id,
      event_attributes: {
        venue_id: venue.id,
        event_type_id: event_type.id,
        name: 'event_name',
        date: Time.zone.tomorrow
      }
    }
  end

  context 'with valid params for a new event' do
    it 'should execute without error' do
      expect(creator.call).to_not be_nil
    end

    it 'an event is added' do
      expect { creator.call }.to change { Event.count }.by(1)
    end

    it 'a role is added' do
      expect { creator.call }.to change { Role.count }.by(1)
    end

    it 'the role has the right attributes' do
      role = creator.call
      event = Event.last
      expect(role.profile).to eq(profile)
      expect(role.event).to eq(event)
      expect(role.creator_id).to eq(user.id)
      expect(role.role_type).to eq(role_type)
    end

    it 'the event has the right attributes' do
      role = creator.call
      event = role.event
      expect(event.name).to eq('event_name')
      expect(event.venue).to eq(venue)
      expect(event.event_type).to eq(event_type)
      expect(event.date).to eq(Time.zone.tomorrow)
    end
  end

  context 'with valid params for an existing event' do
    let(:event_id) { event.id }

    let(:params) do
      {
        role_type_id: role_type.id,
        event_attributes: {
          venue_id: '',
          event_type_id: '',
          name: '',
          date: ''
        }
      }
    end

    it 'should execute without error' do
      expect(creator.call).to_not be_nil
    end

    it 'an event is not added' do
      expect { creator.call }.to change { Event.count }.by(0)
    end

    it 'a role is added' do
      expect { creator.call }.to change { Role.count }.by(1)
    end

    it 'the event has the right attributes' do
      role = creator.call
      expect(role.profile).to eq(profile)
      expect(role.event).to eq(event)
      expect(role.creator_id).to eq(user.id)
      expect(role.role_type).to eq(role_type)
    end
  end

  context 'with invalid permissions for user' do
    let!(:profile) { create(:profile) }

    it 'should not execute without error' do
      expect(creator.call).to be_nil
    end

    it 'an event is not added' do
      expect { creator.call }.to change { Event.count }.by(0)
    end

    it 'a role is not added' do
      expect { creator.call }.to change { Role.count }.by(0)
    end

    it 'provides errors' do
      creator.call
      expect(creator.errors).to eq('Invalid permissions')
    end
  end

  context 'with invalid params for a new event' do
    let(:params) do
      {
        role_type_id: role_type.id,
        event_attributes: {
          venue_id: '',
          event_type_id: event_type.id,
          name: '',
          date: Time.zone.tomorrow
        }
      }
    end

    it 'should not execute without error' do
      expect(creator.call).to be_nil
    end

    it 'an event is not added' do
      expect { creator.call }.to change { Event.count }.by(0)
    end

    it 'a role is not added' do
      expect { creator.call }.to change { Role.count }.by(0)
    end

    it 'provides errors' do
      creator.call
      expect(creator.errors).to eq("Venue must exist and Name can't be blank")
    end
  end
end
