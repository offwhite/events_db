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

  delegate :town, to: :venue

  pg_search_scope :fuzzy_matches,
                  against: %i[name description],
                  using: { tsearch: { any_word: true } }

  def venue_title
    venue.title
  end

  def town_title
    town.title
  end

  def full_title
    "#{name.titleize}, #{venue_title}, #{town_title} - \
    #{date_str}"
  end

  def date_str
    date.strftime('%d %B %Y')
  end

  def date_str_sml
    date.strftime('%d-%m-%y')
  end

  def on_tour?
    tour_id.present?
  end

  def all_roles
    roles + tour_roles
  end

  def tour_roles
    return [] if tour.nil?
    tour.roles
  end

  def owner?(user)
    user&.id == user_id
  end
end

# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :text
#  date          :date
#  event_type_id :integer
#  venue_id      :integer
#  tour_id       :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  verified      :boolean
#  deleted_at    :date
#
