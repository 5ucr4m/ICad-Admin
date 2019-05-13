FactoryBot.define do
  factory :family do
    home_registration { nil }
    responsible_birth_date { "2019-05-13" }
    responsible_cns_number { "MyString" }
    family_members { 1 }
    handbook_number { "MyString" }
    family_income_cents { 1 }
    reside_since { "2019-05-13" }
    moving { false }
    company { nil }
    slug { "MyString" }
  end
end
