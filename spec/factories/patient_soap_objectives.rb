FactoryBot.define do
  factory :patient_soap_objective do
    patient_soap { nil }
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
    dum { "2020-04-03" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 20:37:32" }
    ip { "MyString" }
  end
end
