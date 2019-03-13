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
    name.titleize
  end

  def role_summary
    roles.collect(&:role_type_name).uniq.join(', ')
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :text
#  biography  :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  verified   :boolean
#  validated  :boolean
#
