FactoryBot.define do
  factory :patient_soap_intervention do
    patient_soap { nil }
    sigtap_code { nil }
    ciap_code { nil }
    notes { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 21:41:42" }
    ip { "MyString" }
  end
end
