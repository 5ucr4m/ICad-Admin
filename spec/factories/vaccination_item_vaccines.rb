FactoryBot.define do
  factory :vaccination_item_vaccine do
    vaccination_item { nil }
    vaccine { nil }
    company { nil }
    slug { "MyString" }
  end
end
