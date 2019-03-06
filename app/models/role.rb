class Role < ApplicationRecord
  belongs_to :profile
  belongs_to :event
  belongs_to :role_type

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  profile_id   :integer
#  event_id     :integer
#  role_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
