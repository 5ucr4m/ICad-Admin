FactoryBot.define do
  factory :patient_soap_condition do
    patient_soap { nil }
    ciap_code { nil }
    cid_code { nil }
    active { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-07 00:51:27" }
    ip { "MyString" }
  end
end
