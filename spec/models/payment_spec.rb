require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:contract) }
  it { should belong_to(:user) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:status) }

  describe '#status' do
    it 'should be pending by default' do
      payment = Payment.new
      expect(payment.status).to eq('pending')
    end
  end

  describe "It's should not be valide without a status" do
    it 'should not be valid' do
      payment = Payment.new
      expect(payment).not_to be_valid
    end
  end

  describe "It's should not be valide without a amount" do
    it 'should not be valid' do
      payment = Payment.new
      expect(payment).not_to be_valid
    end
  end
end
