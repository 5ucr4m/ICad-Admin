FactoryBot.define do
  factory :patient_soap_problem do
    patient_soap { nil }
    ciap_code { nil }
    cid_code { nil }
    notes { "MyText" }
    active_problem { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-06 02:31:08" }
    ip { "MyString" }
  end
end
