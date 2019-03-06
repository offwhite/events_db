require 'rails_helper'

describe RoleType do
  context 'relations' do
    it { is_expected.to have_many(:roles) }
  end
end

# == Schema Information
#
# Table name: role_types
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
