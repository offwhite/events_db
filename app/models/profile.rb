class Profile < ApplicationRecord
  belongs_to :user
  has_many :roles

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :text
#  biography  :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
