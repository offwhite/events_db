class Role < ApplicationRecord
  include Roles::Mixins
  extend Roles::Scopes
  default_scope { where(deleted_at: [nil]) }

  belongs_to :profile
  belongs_to :event, optional: true
  belongs_to :tour, optional: true
  belongs_to :role_type
  belongs_to :creator, class_name: 'User'
  has_many :logs, as: :record

  delegate :town, :venue, to: :event

  attr_accessor :profile_name, :role_type_name

  def town
    event&.town
  end

  def venue
    event&.venue
  end

  def parent
    return event if event_id.present?
    tour
  end

  def event_role?
    event_id.present?
  end

  def tour_role?
    tour_id.present?
  end

  def venue_title
    venue.title
  end

  def town_title
    town&.title
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
#  verified     :boolean
#  creator_id   :integer
#  tour_id      :integer
#  deleted_at   :date
#
