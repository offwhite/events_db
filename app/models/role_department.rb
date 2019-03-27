class RoleDepartment < ApplicationRecord
  extend RoleDepartments::Scopes
  include RoleDepartments::Mixins
  default_scope { where(deleted_at: [nil]) }
  has_many :role_types
  has_many :logs, as: :record
end

# == Schema Information
#
# Table name: role_departments
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :date
#
