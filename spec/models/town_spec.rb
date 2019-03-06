require 'rails_helper'

describe Town do
  context 'relations' do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to have_many(:venues) }
  end
end

# == Schema Information
#
# Table name: towns
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  country_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
