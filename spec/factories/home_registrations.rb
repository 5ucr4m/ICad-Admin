FactoryBot.define do
  factory :home_registration do
    health_professional { nil }
    living_condition { nil }
    address { nil }
    registry_updated { false }
    pet_quantity { 1 }
    refuse_registration { false }
    tp_cds_origin { 1 }
    uuid { "MyString" }
    uuid_origin { "MyString" }
    home_type { nil }
    permanence_institution { nil }
    finished { false }
    company { nil }
    slug { "MyString" }
  end
end
