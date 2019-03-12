class Venue < ApplicationRecord
  include PgSearch

  belongs_to :town
  has_many :events, -> { order(date: :desc) }

  pg_search_scope :fuzzy_matches,
                  against: %i[name description address],
                  using: { tsearch: { any_word: true } }

  def title
    name.titleize
  end

  def full_title
    [title, town&.title].join(', ')
  end

  def town_title
    town&.title
  end
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
#
