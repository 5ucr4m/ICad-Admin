FactoryBot.define do
  factory :patient_soap_orientation do
    patient_soap { nil }
    orientation { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-19 02:37:17" }
    ip { "MyString" }
  end
end
