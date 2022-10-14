require 'rails_helper'

RSpec.describe ContractDetail, type: :model do
  it { should belong_to(:contract) }
  it { is_expected.to validate_presence_of(:contract_name) }
  it { is_expected.to validate_presence_of(:contractor_residence) }
  it { is_expected.to validate_presence_of(:job_title) }
  it { is_expected.to validate_presence_of(:description) }
  #  it { is_expected.to validate_format_of(:start_date).with(/\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD") }

  describe "It's invalid without contract_name" do
    it 'should be invalid' do
      contract_detail = build(:contract_detail, contract_name: nil)
      expect(contract_detail).to_not be_valid
    end
  end

  describe "It's invalid without contractor_residence" do
    it 'should be invalid' do
      contract_detail = build(:contract_detail, contractor_residence: nil)
      expect(contract_detail).to_not be_valid
    end
  end

  describe "It's invalid without job_title" do
    it 'should be invalid' do
      contract_detail = build(:contract_detail, job_title: nil)
      expect(contract_detail).to_not be_valid
    end
  end

  describe "It's invalid without description" do
    it 'should be invalid' do
      contract_detail = build(:contract_detail, description: nil)
      expect(contract_detail).to_not be_valid
    end
  end

  describe "It's invalid without start_date" do
    it 'should be invalid' do
      contract_detail = build(:contract_detail, start_date: nil)
      expect(contract_detail).to_not be_valid
    end
  end
end
