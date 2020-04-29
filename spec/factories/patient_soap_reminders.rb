FactoryBot.define do
  factory :patient_soap_reminder do
    patient_soap { nil }
    public_reminder { false }
    description { "MyText" }
    active { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 21:56:44" }
    ip { "MyString" }
  end
end
