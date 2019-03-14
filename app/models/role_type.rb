class RoleType < ApplicationRecord
  extend RoleTypes::Scopes
  include RoleTypes::Mixins
  default_scope { where(deleted_at: [nil]) }

  has_many :roles
  belongs_to :role_department
  has_many :logs, as: :record

  def title
    name.titleize
  end

  def department_name
    role_department&.name
  end
end

# == Schema Information
#
# Table name: role_types
#
#  id                 :integer          not null, primary key
#  name               :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category           :text
#  role_department_id :integer
#  deleted_at         :date
#
