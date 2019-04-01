require 'rails_helper'

describe EventType do
  context 'relations' do
    it { is_expected.to have_many(:events) }
  end
end

# == Schema Information
#
# Table name: event_types
#
#  id                  :bigint(8)        not null, primary key
#  name                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deleted_at          :date
#  event_department_id :bigint(8)
#  description         :text
#
