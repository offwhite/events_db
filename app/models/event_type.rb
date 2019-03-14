class EventType < ApplicationRecord
  has_many :events
  has_many :logs, as: :record

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: event_types
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
