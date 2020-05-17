FactoryBot.define do
  factory :patient_soap_medicine do
    patient_soap { nil }
    medicine { nil }
    concentration { "MyString" }
    pharmaceutical_form { nil }
    administration_way { nil }
    recipe_type { nil }
    dose { "MyString" }
    unique_dose { "MyString" }
    continuous_dose { "MyString" }
    dose_frequency_type { nil }
    dose_frequency { "MyString" }
    dose_quantity { "MyString" }
    treatment_date { "2020-05-16" }
    duration_type { nil }
    duration { "MyString" }
    recommendations { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-16 03:03:27" }
    ip { "MyString" }
  end
end
