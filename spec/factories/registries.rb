FactoryBot.define do
  factory :registry do
    person_type { nil }
    legal_full_name { "MyString" }
    fancy_name { "MyString" }
    social_name { "MyString" }
    federal_registry { "MyString" }
    state_registry { "MyString" }
    slug { "MyString" }
  end
end
