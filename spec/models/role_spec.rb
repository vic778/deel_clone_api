require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }

  # describe 'validations' do
  #   it { should validate_uniqueness_of(:name).case_insensitive }
  # end

  describe 'It is invalid without the name' do
    it 'should be invalid' do
      role = build(:role, name: nil)
      expect(role).to_not be_valid
    end
  end
end
