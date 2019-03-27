class Country < ApplicationRecord
  has_many :towns

  def title
    name.titleize
  end
end

# == Schema Information
#
# Table name: countries
#
#  id         :bigint(8)        not null, primary key
#  name       :text
#  iso        :text
#  language   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
