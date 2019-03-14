require 'rails_helper'

describe Tour do
  context 'relations' do
    it { is_expected.to belong_to(:tour_type) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:events) }
  end
end

# == Schema Information
#
# Table name: tours
#
#  id           :integer          not null, primary key
#  name         :text
#  tour_type_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean
#  deleted_at   :date
#
