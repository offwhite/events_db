require 'rails_helper'

describe Country do
  context 'relations' do
    it { is_expected.to have_many(:towns) }
  end
end

# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :text
#  iso        :text
#  language   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
