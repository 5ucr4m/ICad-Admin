FactoryBot.define do
  factory :health_condition do
    hospitalization_cause { "MyText" }
    other_condition_one { "MyText" }
    other_condition_two { "MyText" }
    other_condition_three { "MyText" }
    medicinal_plants_used { "MyText" }
    maternity_reference { "MyString" }
    weight_situation { nil }
    alcohol_dependent { false }
    other_drugs_dependent { false }
    smoker { false }
    pregnant { false }
    bedridden { false }
    domiciled { false }
    diabetic { false }
    respiratory { false }
    hypertension { false }
    cancer { false }
    kidneys { false }
    leprosy { false }
    tuberculosis { false }
    avc_stroke { false }
    had_heart_attack { false }
    had_heart_disease { false }
    recently_hospitalized { false }
    mental_issue { false }
    integrative_practices { false }
    medicinal_plants { false }
    company { nil }
    slug { "MyString" }
  end
end
