require 'rails_helper'
describe Utilities::Profanity do
  let(:checker) do
    described_class.new(string)
  end

  context 'with a valid string' do
    let(:string) { 'james white' }

    it 'should return false' do
      expect(checker.call).to be_falsey
    end
  end

  context 'with a naughty string' do
    let(:string) { 'fuck you' }

    it 'should return true' do
      expect(checker.call).to be_truthy
    end
  end

  context 'with no string' do
    let(:string) { '' }

    it 'should return true' do
      expect(checker.call).to be_falsey
    end
  end
end
