require 'rails_helper'

describe TourType do
  context 'relations' do
    it { is_expected.to have_many(:tours) }
  end
end
