class Log < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :record, polymorphic: true, optional: true

  default_scope { order(created_at: :desc) }

  def type
    @type ||= record.class.name
  end

  def change_summary
    return if change_values.nil?
    change_values.collect do |a, c|
      next if %w[updated_at created_at].include? a
      "#{a}: #{c.last}"
    end.compact.join(',')
  end
end

# == Schema Information
#
# Table name: logs
#
#  id            :bigint(8)        not null, primary key
#  action        :text
#  record_type   :string
#  record_id     :bigint(8)
#  user_id       :bigint(8)
#  change_values :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
