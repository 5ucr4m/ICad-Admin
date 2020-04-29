FactoryBot.define do
  factory :patient_soap_exam do
    patient_soap_objective { nil }
    exam { nil }
    request_date { "2020-04-03" }
    hemoglobin_glycated { "MyString" }
    realization_date { "2020-04-03" }
    result_date { "2020-04-03" }
    description { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 20:43:10" }
    ip { "MyString" }
  end
end
