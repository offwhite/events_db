class Log < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :record, polymorphic: true, optional: true

  default_scope { order(created_at: :desc) }

  def type
    @type ||= record.class.name
  end
end

# == Schema Information
#
# Table name: logs
#
#  id            :integer          not null, primary key
#  action        :text
#  record_type   :string
#  record_id     :integer
#  user_id       :integer
#  change_values :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
