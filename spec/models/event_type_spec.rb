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
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
