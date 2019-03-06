require 'rails_helper'

describe Venue do
  context 'relations' do
    it { is_expected.to belong_to(:town) }
    it { is_expected.to have_many(:events) }
  end
end
