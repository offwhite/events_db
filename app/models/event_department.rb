class EventDepartment < ApplicationRecord
  extend EventDepartments::Scopes
  include EventDepartments::Mixins
  default_scope { where(deleted_at: [nil]) }
  has_many :event_types, -> { order(:name) }
  has_many :logs, as: :record
end

# == Schema Information
#
# Table name: event_departments
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
