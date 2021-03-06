require 'rails_helper'

describe Event do
  context 'relations' do
    it { is_expected.to belong_to(:event_type) }
    it { is_expected.to belong_to(:venue) }
    it { is_expected.to belong_to(:tour) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:roles) }
  end
end

# == Schema Information
#
# Table name: events
#
#  id            :bigint(8)        not null, primary key
#  name          :text
#  date          :date
#  event_type_id :bigint(8)
#  venue_id      :bigint(8)
#  tour_id       :bigint(8)
#  user_id       :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  verified      :boolean
#  deleted_at    :date
#
