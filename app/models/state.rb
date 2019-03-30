class State < ApplicationRecord
  belongs_to :country
  has_many :towns
end

# == Schema Information
#
# Table name: states
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  iso        :text
#  country_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
