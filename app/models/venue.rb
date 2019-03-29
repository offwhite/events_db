class Venue < ApplicationRecord
  extend Venues::Scopes
  include Venues::Mixins
  default_scope { where(deleted_at: [nil]) }
  include PgSearch

  belongs_to :town
  has_many :events, -> { order(date: :desc) }
  has_many :logs, as: :record

  attr_accessor :lookup_query

  pg_search_scope :fuzzy_matches,
                  against: %i[name description address],
                  using: { tsearch: { any_word: true } }
end

# == Schema Information
#
# Table name: venues
#
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  address     :text
#  town_id     :bigint(8)
#  capacity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  url         :text
#  phone       :text
#  verified    :boolean
#  deleted_at  :date
#  slug        :text
#
