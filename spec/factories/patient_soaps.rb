FactoryBot.define do
  factory :patient_soap do
    patient_record { nil }
    subjective { "MyText" }
    objective { "MyText" }
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
    vaccination_updated { false }
    last_period_date { "2020-05-06" }
    evaluation { "MyText" }
    plan { "MyText" }
    slug { "MyString" }
    user { nil }
    company { nil }
    discarded_at { "2020-05-06 00:16:34" }
    ip { "MyString" }
  end
end
