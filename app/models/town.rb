class Town < ApplicationRecord
  extend Towns::Scopes
  include Towns::Mixins
  default_scope { where(deleted_at: [nil]) }

  has_many :venues
  belongs_to :country
  has_many :logs, as: :record

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
#  latitude    :float
#  longitude   :float
#  deleted_at  :date
#
