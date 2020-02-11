FactoryBot.define do
  factory :medicine do
    substance { "MyString" }
    laboratory { "MyString" }
    laboratory_registry { "MyString" }
    ggrem_code { "MyString" }
    registry { "MyString" }
    ean_one { "MyString" }
    ean_two { "MyString" }
    ean_three { "MyString" }
    active_principle { "MyString" }
    therapeutic_class { nil }
    product_type { nil }
    stripe { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-02-10 03:57:40" }
    ip { "MyString" }
  end
end
