require 'rails_helper'
describe Utilities::Cleaner do
  let(:cleaner) do
    described_class.new(string)
  end

  context 'with valid string' do
    let(:string) { 'this is a test' }
    it 'should execute without error' do
      expect(cleaner.call).to eq(string)
    end

    it 'return a valid username string' do
      expect(cleaner.username).to eq('this-is-a-test')
    end
  end

  context 'with invalid characters' do
    let(:string) { 'Who wants a ☕? {}[]&^%' }
    it 'should remove all non alphanumeric chars' do
      expect(cleaner.call).to eq('Who wants a')
    end
  end
end
