require 'rails_helper'
describe Utilities::Logger do
  let(:logger) do
    described_class.new(record, action, user, change_set)
  end

  let!(:record) { create(:event, name: 'massive attack') }
  let!(:user) { create(:user) }
  let(:action) { 'edit record' }
  let(:change_set) { nil }

  context 'with valid params' do
    it 'should execute successfuly' do
      expect(logger.call).to be_truthy
    end

    it 'should create a new log entry' do
      expect { logger.call }.to change { Log.count }.by(1)
    end

    it 'should add log entry to record' do
      expect { logger.call }.to change { record.reload.logs.count }.by(1)
    end

    it 'should add log entry to record' do
      logger.call
      log = record.logs.last
      expect(log.action).to eq(action)
    end
  end

  context 'with a different record type' do
    let!(:record) { create(:role) }

    it 'should add log entry to record' do
      expect { logger.call }.to change { record.reload.logs.count }.by(1)
    end

    it 'should add log entry to record' do
      logger.call
      log = record.logs.last
      expect(log.action).to eq(action)
    end
  end
end
