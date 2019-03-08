require 'rails_helper'

describe Role do
  context 'relations' do
    it { is_expected.to belong_to(:profile) }
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:role_type) }
  end
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  profile_id   :integer
#  event_id     :integer
#  role_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
