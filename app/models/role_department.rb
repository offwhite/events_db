class RoleDepartment < ApplicationRecord
  has_many :roles
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
#
