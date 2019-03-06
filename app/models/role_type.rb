class RoleType < ApplicationRecord
  has_many :roles

  def title
    name.titleize
  end
end
