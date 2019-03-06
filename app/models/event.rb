class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :venue
  belongs_to :tour
  belongs_to :user
  has_many :roles

  def title
    name.titleize
  end
end
