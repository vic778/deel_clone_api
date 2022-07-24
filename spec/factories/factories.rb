FactoryBot.define do
  factory :role do
    name { Role.names.keys.sample }
    to_create do |instance|
      instance.id = Role.find_or_create_by(name: instance.name).id
      instance.reload
    end
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    association :role, factory: :role, name: 'user'

    trait :admin do
      association :role, factory: :role, name: 'cpmpany'
    end

    trait :teacher do
      association :role, factory: :role, name: 'admin'
    end
  end

  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    country { Faker::Address.country }

    association :user, factory: :user
  end

  factory :company do
    legal_name { Faker::Company.name }
    company_type { Faker::Company.type }
    phone_number { Faker::PhoneNumber.phone_number }
    registration_number { Faker::Company.swedish_organisation_number }
    vat_id { Faker::Company.swedish_organisation_number }

    association :profile, factory: :profile
  end

  factory :contract do
    name { Contract.names.keys.sample }
    association :company, factory: :company
    association :user, factory: :user
  end

  factory :payment do
    amount { Faker::Number.number(digits: 2) }
    status { Payment.statuses.keys.sample }

    association :contract, factory: :contract
    association :user, factory: :user
  end

  factory :contract_detail do
    contract_name { Faker::Name.name }
    contractor_residence { Faker::Address.street_address }
    job_title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.forward(days: 30) }
    over_date { Faker::Date.forward(days: 30) }

    association :contract, factory: :contract
  end
end
