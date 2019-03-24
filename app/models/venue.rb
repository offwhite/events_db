class Venue < ApplicationRecord
  extend Venues::Scopes
  include Venues::Mixins
  default_scope { where(deleted_at: [nil]) }
  include PgSearch

  belongs_to :town
  has_many :events, -> { order(date: :desc) }
  has_many :logs, as: :record

  pg_search_scope :fuzzy_matches,
                  against: %i[name description address],
                  using: { tsearch: { any_word: true } }
end

# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  address     :text
#  town_id     :integer
#  capacity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  url         :text
#  phone       :text
#  verified    :boolean
#  deleted_at  :date
#
