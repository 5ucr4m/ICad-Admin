FactoryBot.define do
  factory :patient_soap_orientation do
    patient_soap { nil }
    orientation { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 22:50:37" }
    ip { "MyString" }
  end
end
