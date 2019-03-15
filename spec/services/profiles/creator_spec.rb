require 'rails_helper'
describe Profiles::Creator do
  let(:creator) do
    described_class.new(name, user)
  end

  let!(:user) { create(:user) }
  let(:name) { 'Alan Alder' }

  context 'with valid params' do
    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should create a new profile' do
      expect { creator.call }.to change { Profile.count }.by(1)
    end

    it 'profile should have the right name' do
      profile = creator.call
      expect(profile.name).to eq(name)
    end

    it 'profile should have the right ordinal' do
      profile = creator.call
      expect(profile.ordinal).to eq(0)
    end

    it 'profile should have the right username' do
      profile = creator.call
      expect(profile.username).to eq('alan-alder')
    end
  end

  # dupes

  context 'with the same name as an existing profile' do
    let!(:profile) { create(:profile, name: 'Alan alder') }

    it 'should create a new profile' do
      expect { creator.call }.to change { Profile.count }.by(1)
    end

    it 'profile should have the right name' do
      profile = creator.call
      expect(profile.name).to eq(name)
    end

    it 'profile should have the right ordinal' do
      profile = creator.call
      expect(profile.ordinal).to eq(1)
    end

    it 'profile should have the right username' do
      profile = creator.call
      expect(profile.username).to eq('alan-alder-1')
    end
  end

  context 'with the same name as an existing profile and a high ordinal' do
    let!(:profile) do
      create(
        :profile,
        name: 'Alan alder',
        username: 'alan-alder-1',
        ordinal: 1
      )
    end

    let!(:profile) do
      create(
        :profile,
        name: 'Alan alder',
        username: 'alan-alder-5',
        ordinal: 5
      )
    end

    it 'should create a new profile' do
      expect { creator.call }.to change { Profile.count }.by(1)
    end

    it 'profile should have the right name' do
      profile = creator.call
      expect(profile.name).to eq(name)
    end

    it 'profile should have the right ordinal' do
      profile = creator.call
      expect(profile.ordinal).to eq(6)
    end

    it 'profile should have the right username' do
      profile = creator.call
      expect(profile.username).to eq('alan-alder-6')
    end

    context 'with the same username as an existing record' do
      let!(:profile) do
        create(
          :profile,
          name: 'Alan alder',
          username: 'alan-alder-2',
          ordinal: 1
        )
      end

      it 'should not create a new profile' do
        expect(creator.call).to be_falsey
      end
    end
  end
end
