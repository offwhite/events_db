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

  accepts_nested_attributes_for :event

  attr_accessor :profile_name, :role_type_name, :venue_name
end

# == Schema Information
#
# Table name: roles
#
#  id           :bigint(8)        not null, primary key
#  profile_id   :bigint(8)
#  event_id     :bigint(8)
#  role_type_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean
#  creator_id   :integer
#  tour_id      :integer
#  deleted_at   :date
#
