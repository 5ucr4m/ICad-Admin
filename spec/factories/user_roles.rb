FactoryBot.define do
  factory :user_role do
    company { nil }
    user { nil }
    role { nil }
    current_company { false }
    current_module { 1 }
    slug { "MyString" }
  end
end
