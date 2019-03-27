class RoleType < ApplicationRecord
  extend RoleTypes::Scopes
  include RoleTypes::Mixins
  default_scope { where(deleted_at: [nil]) }

  include PgSearch

  has_many :roles
  belongs_to :role_department
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

  def title
    name.titleize
  end

  def department_name
    role_department&.name
  end
end

# == Schema Information
#
# Table name: role_types
#
#  id                 :bigint(8)        not null, primary key
#  name               :text
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category           :text
#  role_department_id :bigint(8)
#  deleted_at         :date
#
