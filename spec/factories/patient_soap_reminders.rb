FactoryBot.define do
  factory :patient_soap_reminder do
    patient_soap { nil }
    description { "MyText" }
    private_reminder { false }
    active { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-11 03:16:18" }
    ip { "MyString" }
  end
end
