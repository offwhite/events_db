require 'rails_helper'
describe Users::Creator do
  let(:creator) do
    described_class.new(params)
  end

  let!(:user) { create(:user) }

  let(:params) do
    {
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    }
  end

  context 'with valid params' do
    it 'should execute without error' do
      expect(creator.call).to be_truthy
    end

    it 'should create a new user' do
      expect { creator.call }.to change { User.count }.by(1)
    end

    it 'should set the params' do
      creator.call
      user = User.last
      expect(user.email).to eq params[:email]
    end
  end

  context 'with missing email' do
    let(:params) do
      {
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'should return nil' do
      expect(creator.call).to be_nil
    end

    it 'should not create a new user' do
      expect { creator.call }.to change { User.count }.by(0)
    end

    it 'should return an error string' do
      expect(creator.errors).to include("Email can't be blank")
    end
  end

  context 'with invalid email' do
    let(:params) do
      {
        email: 'test',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'should return nil' do
      expect(creator.call).to be_nil
    end

    it 'should not create a new user' do
      expect { creator.call }.to change { User.count }.by(0)
    end

    it 'should return an error string' do
      expect(creator.errors).to include('Email is invalid')
    end
  end

  context 'with an existing email' do
    let(:params) do
      {
        email: user.email,
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'should return nil' do
      expect(creator.call).to be_nil
    end

    it 'should not create a new user' do
      expect { creator.call }.to change { User.count }.by(0)
    end

    it 'should return an error string' do
      expect(creator.errors)
        .to include('Email has already been taken')
    end
  end

  context 'with mis-matched passwords' do
    let(:params) do
      {
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'different password'
      }
    end

    it 'should return nil' do
      expect(creator.call).to be_nil
    end

    it 'should not create a new user' do
      expect { creator.call }.to change { User.count }.by(0)
    end

    it 'should return an error string' do
      expect(creator.errors)
        .to include("Password confirmation doesn't match Password")
    end
  end
end
