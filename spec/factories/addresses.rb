FactoryBot.define do
  factory :address do
    address_type { nil }
    patio { "MyString" }
    number { "MyString" }
    zip { "MyString" }
    complement { "MyString" }
    district { "MyString" }
    city { nil }
    referential_phone { "MyString" }
    home_phone { "MyString" }
    reference { "MyString" }
    out_area { false }
    micro_area { "MyString" }
    company { nil }
    slug { "MyString" }
  end
end
