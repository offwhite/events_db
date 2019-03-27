require 'rails_helper'

describe Role do
  context 'relations' do
    it { is_expected.to belong_to(:profile) }
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:role_type) }
  end

  context 'deletions' do
    let!(:role) { create(:role) }

    it "doesn't delete the role from the db" do
      role.delete
      expect(Role.count).to eq(0)
      expect(Role.unscoped.count).to eq(1)
    end

    it 'sets the deleted at date' do
      role.delete
      expect(role.deleted_at).to_not be_nil
    end
  end
end

# == Schema Information
#
# Table name: roles
#
#  id           :bigint(8)        not null, primary key
#  profile_id   :bigint(8)
#  event_id     :bigint(8)
#  role_type_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean
#  creator_id   :integer
#  tour_id      :integer
#  deleted_at   :date
#
