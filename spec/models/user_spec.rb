require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:role) }
  it { should have_one(:profile) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:password_confirmation) }

  describe 'validations' do
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_confirmation_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#update_role' do
    it 'should update role' do
      user = build(:user)
      user.update_role('admin')
      expect(user.role.name).to eq('admin')
    end
  end

  describe 'It is invalid without a username' do
    it 'should be invalid' do
      user = build(:user, username: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'It is invalid without an email' do
    it 'should be invalid' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'It is invalid without a password' do
    it 'should be invalid' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'It is invalid without a password_confirmation' do
    it 'should be invalid' do
      user = build(:user, password_confirmation: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'It is invalid without a role' do
    it 'should be invalid' do
      user = build(:user, role: nil)
      expect(user).to_not be_valid
    end
  end
end
