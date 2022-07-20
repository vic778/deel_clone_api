FactoryBot.define do
  factory :contract_detail do
    contract_name { "MyString" }
    contractor_residence { "MyString" }
    job_title { "MyString" }
    description { "MyText" }
    start_date { "MyString" }
    over_date { "MyString" }
    contract { nil }
  end
end
