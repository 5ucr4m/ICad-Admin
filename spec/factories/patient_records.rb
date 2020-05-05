FactoryBot.define do
  factory :patient_record do
    appointment_booking { nil }
    appointment_demand { nil }
    appointment_reason { nil }
    appointment_brief { "MyText" }
    cephalic_perimeter { "MyString" }
    weight { "MyString" }
    height { "MyString" }
    imc { "MyString" }
    calf_perimeter { "MyString" }
    blood_pressure { "MyString" }
    blood_pressure_to { "MyString" }
    respiratory_rate { "MyString" }
    heart_rate { "MyString" }
    temperature { "MyString" }
    saturation { "MyString" }
    capillary_blood { "MyString" }
    collected_time { nil }
    risk_vulnerability { 1 }
    release_citizen { false }
    patient_record { nil }
    other_appointment_booking { nil }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-03-11 01:53:41" }
    ip { "MyString" }
  end
end
