require 'rails_helper'

describe Profile do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:roles) }
  end
end
