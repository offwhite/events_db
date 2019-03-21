class Profile < ApplicationRecord
  extend Profiles::Scopes
  include Profiles::Mixins
  default_scope { where(deleted_at: [nil]) }

  include PgSearch

  belongs_to :user, optional: true
  has_many :roles
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
end

# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  name          :text
#  biography     :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  verified      :boolean
#  validated     :boolean
#  ordinal       :integer          default(0)
#  date_of_birth :date
#  phone         :text
#  url           :text
#  merged_id     :integer
#  deleted_at    :date
#
