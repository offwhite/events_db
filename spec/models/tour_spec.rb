require 'rails_helper'

describe Tour do
  context 'relations' do
    it { is_expected.to belong_to(:tour_type) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:events) }
  end
end
