FactoryBot.define do
  factory :generic_model do
    name { "MyString" }
    description { "MyString" }
    reference { "MyString" }
    generic_field { "MyString" }
    generic_class { "MyString" }
    generic_model { nil }
    slug { "MyString" }
  end
end
