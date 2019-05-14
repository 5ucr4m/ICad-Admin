FactoryBot.define do
  factory :health_condition_other do
    health_condition { nil }
    description { "MyText" }
    company { nil }
    slug { "MyString" }
  end
end
