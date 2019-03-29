class Town < ApplicationRecord
  extend Towns::Scopes
  include Towns::Mixins
  default_scope { where(deleted_at: [nil]) }

  include PgSearch

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
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  country_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  deleted_at  :date
#  state       :text
#
