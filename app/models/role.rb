class Role < ApplicationRecord
  belongs_to :profile
  belongs_to :event
  belongs_to :role_type

  def title
    name.titleize
  end
end
