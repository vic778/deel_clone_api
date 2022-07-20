FactoryBot.define do
  factory :company do
    legal_name { "MyString" }
    company_type { "MyString" }
    phone_number { "MyString" }
    registration_number { "MyString" }
    vat_id { "MyString" }
    profile { nil }
  end
end
