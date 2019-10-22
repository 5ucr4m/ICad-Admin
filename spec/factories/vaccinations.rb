FactoryBot.define do
  factory :vaccination do
    uuid { "MyString" }
    tp_cds_origin { "MyString" }
    patient_type { 1 }
    header_transport { nil }
    vaccination_campaign { nil }
    turn { nil }
    family_member { nil }
    local_service { nil }
    traveller { false }
    leprosy_communicant { false }
    pregnant { false }
    puerperal { false }
    initial_date_hour { "2019-10-18 21:57:04" }
    final_date_hour { "2019-10-18 21:57:04" }
    company { nil }
    slug { "MyString" }
  end
end
