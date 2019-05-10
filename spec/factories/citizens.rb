FactoryBot.define do
  factory :citizen do
    registry { nil }
    gender { nil }
    race { nil }
    birth_state { nil }
    nationality { nil }
    birth_date { "2019-05-09" }
    birth_country { nil }
    mother_name { "MyString" }
    sus_card_number { "MyString" }
    pis_pasep_number { "MyString" }
    unknown_mother_name { false }
    responsible_person { nil }
    health_condition { nil }
    company { nil }
    slug { "MyString" }
  end
end
