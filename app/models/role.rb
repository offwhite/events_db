class Role < ApplicationRecord
  belongs_to :profile
  belongs_to :event, optional: true
  belongs_to :tour, optional: true
  belongs_to :role_type
  belongs_to :creator, class_name: 'User'

  delegate :town, :venue, to: :event

  attr_accessor :profile_name

  def event_role?
    event_id.present?
  end

  def tour_role?
    tour_id.present?
  end

  def role_type_name
    role_type.name
  end

  def venue_title
    venue.title
  end

  def town_title
    town.title
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
