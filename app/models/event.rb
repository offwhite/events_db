class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :venue
  belongs_to :tour, optional: true
  belongs_to :user
  has_many :roles

  validates :name, presence: true

  delegate :town, to: :venue

  def venue_title
    venue.title
  end

  def town_title
    town.title
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
#
