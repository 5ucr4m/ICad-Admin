FactoryBot.define do
  factory :patient_condition do
    family_member { nil }
    medical_procedure { nil }
    age_initial { "2020-04-03" }
    last_update { "2020-04-03" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 00:29:10" }
    ip { "MyString" }
  end
end
