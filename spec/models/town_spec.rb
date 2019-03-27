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
#  id          :bigint(8)        not null, primary key
#  name        :text
#  description :text
#  country_id  :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  deleted_at  :date
#
