FactoryBot.define do
  factory :payment do
    amount { 1.5 }
    contract { nil }
    user { nil }
  end
end
