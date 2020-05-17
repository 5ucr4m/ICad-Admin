FactoryBot.define do
  factory :patient_soap_intervention do
    patient_soap { nil }
    ciap_code { nil }
    cid_code { nil }
    notes { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-10 23:47:21" }
    ip { "MyString" }
  end
end
