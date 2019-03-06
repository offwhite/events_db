class RoleType < ApplicationRecord
  has_many :roles

  def title
    name.titleize
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
