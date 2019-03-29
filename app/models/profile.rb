class Profile < ApplicationRecord
  extend Profiles::Scopes
  include Profiles::Mixins
  default_scope { where(deleted_at: [nil]) }

  include PgSearch

  belongs_to :user, optional: true
  belongs_to :hometown, optional: true, class_name: 'Town'
  has_many :roles
  has_many :evens, through: :roles
  has_many :logs, as: :record

  pg_search_scope :fuzzy_matches,
                  against: %i[name],
                  using: {
                    tsearch: {
                      any_word: true,
                      dictionary: 'english'
                    }
                  }

  pg_search_scope :matches,
                  against: %i[name],
                  using: {
                    trigram: {
                      threshold: 0.2
                    }
                  }

  attr_accessor :lookup_query
  validates :name, length: { minimum: 5 }

  validate do
    if Utilities::Profanity.new(name).call
      errors[:base] << "You can't have profanity in your name"
    end
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id             :bigint(8)        not null, primary key
#  name           :text
#  biography      :text
#  user_id        :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  verified       :boolean
#  validated      :boolean
#  ordinal        :integer          default(1)
#  date_of_birth  :date
#  phone          :text
#  url            :text
#  merged_id      :integer
#  deleted_at     :date
#  username       :text
#  pro_expires    :date
#  equipment_tags :text
#  hometown_id    :bigint(8)
#
