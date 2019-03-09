require 'rails_helper'
describe Events::Creator do
  let(:creator) do
    described_class.new(params, user)
  end

  let!(:user) { create(:user) }
  let!(:venue) { create(:venue) }
  let!(:event_type) { create(:event_type) }

  let(:params) do
    {
      name: 'event name',
      description: 'event description',
      venue_id: venue.id,
      event_type_id: event_type.id,
      date: '01-01-2019'
    }
  end

  context 'with valid params' do
    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should create a new event' do
      expect { creator.call }.to change { Event.count }.by(1)
    end

    it 'should sets the params' do
      creator.call
      event = Event.last
      expect(event.name).to eq params[:name]
      expect(event.description).to eq params[:description]
    end
  end

  context 'with duplicate params' do
    let!(:event) do
      create(
        :event,
        name: params[:name],
        date: params[:date],
        venue_id: venue.id
      )
    end

    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should not create a new event' do
      expect { creator.call }.to change { Event.count }.by(0)
    end
  end
end
