require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should belong_to(:company) }
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }

  # describe "it's should not be valid" do
  #   it "when name is not unique" do
  #     contract = create(:contract)
  #     expect(build(:contract, name: contract.name)).to_not be_valid
  #   end
  # end
end
