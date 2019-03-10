class Venue < ApplicationRecord
  belongs_to :town
  has_many :events

  def title
    name.titleize
  end

  def full_title
    [title, town&.title].join(', ')
  end
end

# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  address     :text
#  town_id     :integer
#  capacity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  url         :text
#  phone       :text
#  verified    :boolean
#
