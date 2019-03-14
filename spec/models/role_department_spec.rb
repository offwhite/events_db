require 'rails_helper'

describe RoleDepartment do
  context 'relations' do
    it { is_expected.to have_many(:role_types) }
  end
end

# == Schema Information
#
# Table name: role_departments
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :date
#
