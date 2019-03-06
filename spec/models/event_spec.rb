require 'rails_helper'

describe Event do
  context 'relations' do
    it { is_expected.to belong_to(:event_type) }
    it { is_expected.to belong_to(:venue) }
    it { is_expected.to belong_to(:tour) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:roles) }
  end
end
