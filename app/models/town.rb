class Town < ApplicationRecord
  has_many :venues
  belongs_to :country

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: towns
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  country_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
