FactoryBot.define do
  factory :patient_soap_reason do
    patient_soap { nil }
    medical_procedure { nil }
    notes { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 20:33:49" }
    ip { "MyString" }
  end
end
