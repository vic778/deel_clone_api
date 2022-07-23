require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of(:legal_name) }
  it { should validate_presence_of(:company_type) }
  it { should validate_presence_of(:registration_number) }

  it { should belong_to(:profile) }
  it { should have_many(:contracts) }
end
