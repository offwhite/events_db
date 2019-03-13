require 'rails_helper'

describe Profile do
  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:roles) }
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  name          :text
#  biography     :text
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  verified      :boolean
#  validated     :boolean
#  ordinal       :integer          default(0)
#  date_of_birth :date
#  phone         :text
#  url           :text
#  merged_id     :integer
#
