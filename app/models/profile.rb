class Profile < ApplicationRecord
  include PgSearch

  belongs_to :user, optional: true
  has_many :roles

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

  def title
    name.titleize + ordinal_str
  end

  def ordinal_str
    return '' if ordinal.zero?
    " (#{ordinal.ordinalize})"
  end

  def role_type_names
    role_types.collect(&:name)
  end

  def role_types
    roles.collect(&:role_type).uniq
  end

  def town_titles
    roles.collect(&:town_title).uniq.to_sentence
  end

  def town_titles_sml
    roles.collect(&:town_title).uniq[0..3].to_sentence
  end

  def events
    roles.collect(&:event).uniq
  end
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
#
