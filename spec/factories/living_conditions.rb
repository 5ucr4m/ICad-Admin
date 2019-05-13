FactoryBot.define do
  factory :living_condition do
    water_supply { nil }
    rural_production_area { nil }
    garbage_disposal { nil }
    bathroom_drainage { nil }
    home_location { nil }
    home_wall_material { nil }
    rooms { 1 }
    residents { 1 }
    home_situation { nil }
    electric_power { false }
    home_access { nil }
    home_type { nil }
    water_treatment { nil }
    company { nil }
    slug { "MyString" }
  end
end
