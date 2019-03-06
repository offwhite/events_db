class Tour < ApplicationRecord
  belongs_to :tour_type
  belongs_to :user
  has_many :events

  def title
    name.titleize
  end
end
