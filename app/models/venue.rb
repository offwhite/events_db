class Venue < ApplicationRecord
  belongs_to :town
  has_many :events

  def title
    name.titleize
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
#
