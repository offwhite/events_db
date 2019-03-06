class EventType < ApplicationRecord
  has_many :events

  def title
    name.titleize
  end
end
