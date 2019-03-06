class Profile < ApplicationRecord
  belongs_to :user
  has_many :roles

  def title
    name.titleize
  end
end
