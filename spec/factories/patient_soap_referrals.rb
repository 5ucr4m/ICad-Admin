FactoryBot.define do
  factory :patient_soap_referral do
    patient_soap { nil }
    expertise { nil }
    complement { "MyString" }
    cid_code { nil }
    risk_classification { 1 }
    referral_reason { "MyText" }
    observation { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 22:53:56" }
    ip { "MyString" }
  end
end
