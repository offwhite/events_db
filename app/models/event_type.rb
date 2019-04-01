class EventType < ApplicationRecord
  include EventTypes::Mixins
  default_scope { where(deleted_at: [nil]) }

  belongs_to :event_department

  has_many :events
  has_many :logs, as: :record

  validates :name, presence: true

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: event_types
#
#  id                  :bigint(8)        not null, primary key
#  name                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deleted_at          :date
#  event_department_id :bigint(8)
#  description         :text
#
