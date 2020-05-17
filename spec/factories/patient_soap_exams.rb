FactoryBot.define do
  factory :patient_soap_exam do
    patient_soap { nil }
    exam { nil }
    cid_code { nil }
    request_date { "2020-05-06" }
    user { nil }
    accomplishment_date { "2020-05-06" }
    result_date { "2020-05-06" }
    description { "MyText" }
    glycated_hemoglobin { "MyString" }
    procedure_justification { "MyText" }
    observation { "MyText" }
    high_cost { false }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-06" }
    ip { "MyString" }
  end
end
