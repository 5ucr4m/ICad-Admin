FactoryBot.define do
  factory :vaccination_item do
    vaccination { nil }
    turn { nil }
    family_member { nil }
    local_service { nil }
    traveller { false }
    leprosy_communicant { false }
    pregnant { false }
    puerperal { false }
    company { nil }
    slug { "MyString" }
  end
end
