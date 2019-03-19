require 'rails_helper'
describe Profiles::Claimer do
  let(:claimer) do
    described_class.new(profile, user)
  end

  let!(:user) { create(:user) }
  let(:profile) { create(:profile) }

  before do
    allow_any_instance_of(::Utilities::Slack)
      .to receive(:call)
      .and_return(true)
  end

  context 'with valid params' do
    it 'should execute without error' do
      expect(claimer.call).to be_truthy
    end

    it 'set the user on the profile' do
      claimer.call
      expect(profile.reload.user).to eq(user)
    end

    it 'the event is logged' do
      expect { claimer.call }.to change { Log.count }.by(1)
    end

    it 'calls slack notifier' do
      expect(::Utilities::Slack)
        .to receive(:new).and_return(OpenStruct.new(call: true))
      claimer.call
    end
  end
end
