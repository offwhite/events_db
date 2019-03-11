require 'rails_helper'
describe Search::Global do
  let(:search) do
    described_class.new(query_str)
  end

  let!(:massive_attack) do
    create(
      :event,
      name: 'massive attack'
    )
  end

  let!(:massive_hands) do
    create(
      :event,
      name: 'massive hands'
    )
  end

  let!(:portishead) do
    create(
      :event,
      name: 'portishead'
    )
  end

  context 'with a valid query string' do
    let(:query_str) { 'massive attack' }

    it 'should execute without error' do
      expect(search.events).to be_truthy
    end

    it 'should find the right events' do
      expect(search.events).to include(massive_attack)
      expect(search.events).to include(massive_hands)
      expect(search.events).to_not include(portishead)
    end
  end
end
