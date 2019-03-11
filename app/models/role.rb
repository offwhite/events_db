class Role < ApplicationRecord
  belongs_to :profile
  belongs_to :event, optional: true
  belongs_to :tour, optional: true
  belongs_to :role_type
  belongs_to :creator, class_name: 'User'

  def event_role?
    event_id.present?
  end

  def tour_role?
    tour_id.present?
  end
end

# == Schema Information
#
# Table name: roles
#
#  id                 :integer          not null, primary key
#  profile_id         :integer
#  event_id           :integer
#  role_type_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  verified           :boolean
#  creator_id         :integer
#  tour_id            :integer
#  role_department_id :integer
#
