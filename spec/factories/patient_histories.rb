FactoryBot.define do
  factory :patient_history do
    family_member { nil }
    medical_care { nil }
    patient_soap { nil }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-04 01:33:16" }
    ip { "MyString" }
  end
end
