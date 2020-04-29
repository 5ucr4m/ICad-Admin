FactoryBot.define do
  factory :patient_soap_problem do
    patient_soap { nil }
    medical_procedure { nil }
    cid_code { nil }
    notes { "MyText" }
    active_condition { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 21:27:30" }
    ip { "MyString" }
  end
end
