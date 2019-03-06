require 'rails_helper'

describe EventType do
  context 'relations' do
    it { is_expected.to have_many(:events) }
  end
end
