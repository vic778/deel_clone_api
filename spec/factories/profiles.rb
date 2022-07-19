FactoryBot.define do
  factory :profile do
    first_name { "MyString" }
    last_name { "MyString" }
    date_of_birth { "MyString" }
    country { "MyString" }
    avatar_url { "MyString" }
    video_url { "MyString" }
    user { nil }
  end
end
