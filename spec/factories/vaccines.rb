FactoryBot.define do
  factory :vaccine do
    description { "MyString" }
    immunobiological { nil }
    vaccination_strategy { nil }
    dose { nil }
    lot_number { "MyString" }
    manufacturer { "MyString" }
    company { nil }
    slug { "MyString" }
  end
end
