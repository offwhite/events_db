require 'rails_helper'

describe Profile do
  context 'relations' do
    it { is_expected.to belong_to(:profile) }
    it { is_expected.to belong_to(:event) }
    it { is_expected.to have_many(:role_types) }
  end
end
