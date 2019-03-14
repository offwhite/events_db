class Log < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :record, polymorphic: true, optional: true

  default_scope { order(created_at: :desc) }

  def type
    @type ||= record.class.name
  end
end
