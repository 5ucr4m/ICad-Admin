FactoryBot.define do
  factory :appointment_demand do
    family_member { nil }
    health_professional { nil }
    manage_medicine { false }
    curative { false }
    appointment_demand { false }
    initial_listening { false }
    examination { false }
    nebulization { false }
    dentistry { false }
    procedures { false }
    vaccine { false }
    company { nil }
    discarded_at { "2020-03-11 01:58:13" }
    ip { "MyString" }
  end
end
