FactoryBot.define do
  factory :permission do
    model_reference { "MyString" }
    action_reference { "MyString" }
    app_module { nil }
    slug { "MyString" }
  end
end
