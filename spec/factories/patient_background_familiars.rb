FactoryBot.define do
  factory :patient_background_familiar do
    patient_background { nil }
    ciap_code { nil }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-04 01:28:46" }
    ip { "MyString" }
  end
end
