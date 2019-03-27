class Tour < ApplicationRecord
  include PgSearch
  include Tours::Mixins
  default_scope { where(deleted_at: [nil]) }

  belongs_to :tour_type, class_name: 'EventType'
  belongs_to :user
  has_many :events
  has_many :event_roles, through: :events
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

  def title
    return "#{name} tour".titleize unless name.include?(' tour')
    name.titleize
  end

  def all_roles
    roles + event_roles
  end
end

# == Schema Information
#
# Table name: tours
#
#  id           :bigint(8)        not null, primary key
#  name         :text
#  tour_type_id :bigint(8)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean
#  deleted_at   :date
#
