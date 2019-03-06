class TourType < ApplicationRecord
  has_many :tours

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: tour_types
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
