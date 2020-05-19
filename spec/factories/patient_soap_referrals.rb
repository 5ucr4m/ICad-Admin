FactoryBot.define do
  factory :patient_soap_referral do
    patient_soap { nil }
    specialty { nil }
    complement { "MyString" }
    cid_code { nil }
    risk_classification { 1 }
    referral_reason { "MyText" }
    observations { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-19 02:48:42" }
    ip { "MyString" }
  end
end
