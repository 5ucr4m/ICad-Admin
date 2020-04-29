FactoryBot.define do
  factory :patient_medicine do
    family_member { nil }
    prescription { "2020-04-03" }
    conclusion { "2020-04-03" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 00:34:56" }
    ip { "MyString" }
  end
end
