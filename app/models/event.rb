class Event < ApplicationRecord
  include PgSearch
  include Events::Mixins
  extend Events::Scopes
  default_scope { where(deleted_at: [nil]) }

  belongs_to :event_type
  belongs_to :venue
  belongs_to :tour, optional: true
  belongs_to :user
  has_many :roles
  has_many :logs, as: :record

  validates :name, presence: true

  delegate :town, :latitude, :longitude, :has_coords?, to: :venue


  attr_accessor :lookup_query

  pg_search_scope :fuzzy_matches,
                  against: %i[name description],
                  using: { tsearch: { any_word: true } }
end

# == Schema Information
#
# Table name: events
#
#  id            :bigint(8)        not null, primary key
#  name          :text
#  date          :date
#  event_type_id :bigint(8)
#  venue_id      :bigint(8)
#  tour_id       :bigint(8)
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  verified      :boolean
#  deleted_at    :date
#
