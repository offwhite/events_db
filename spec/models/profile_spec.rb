require 'rails_helper'

describe Profile do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:roles) }
  end

  context 'deletions' do
    let!(:profile) { create(:profile, username: 'username') }

    it "doesn't delete the profile from the db" do
      profile.delete
      expect(Profile.count).to eq(0)
      expect(Profile.unscoped.count).to eq(1)
    end

    it 'sets the deleted at date' do
      profile.delete
      expect(profile.deleted_at).to_not be_nil
    end

    it 'updates the profile username to remove conflicts' do
      profile.delete
      expect(profile.username).to_not eq('username')
    end
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id             :bigint(8)        not null, primary key
#  name           :text
#  biography      :text
#  user_id        :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  verified       :boolean
#  validated      :boolean
#  ordinal        :integer          default(1)
#  date_of_birth  :date
#  phone          :text
#  url            :text
#  merged_id      :integer
#  deleted_at     :date
#  username       :text
#  pro_expires    :date
#  equipment_tags :text
#  hometown_id    :bigint(8)
#
