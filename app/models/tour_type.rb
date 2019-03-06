class TourType < ApplicationRecord
  has_many :tours

  def title
    name.titleize
  end
end
