require 'rails_helper'

describe RoleType do
  context 'relations' do
    it { is_expected.to have_many(:roles) }
  end
end
