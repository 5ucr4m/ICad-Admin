FactoryBot.define do
  factory :other_health_condition do
    health_condition { nil }
    health_condition_type { nil }
    description { "MyText" }
    company { nil }
    slug { "MyString" }
  end
end
