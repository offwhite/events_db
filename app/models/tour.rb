class Tour < ApplicationRecord
  belongs_to :tour_type, class_name: 'EventType'
  belongs_to :user
  has_many :events

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: tours
#
#  id           :integer          not null, primary key
#  name         :text
#  tour_type_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean
#
