FactoryBot.define do
  factory :health_condition do
    hospitalization_cause { "MyText" }
    maternity_reference { "MyString" }
    weight_situation { nil }
    alcohol_dependent { false }
    other_drugs_dependent { false }
    smoker { false }
    pregnant { false }
    bedridden { false }
    domiciled { false }
    diabetic { false }
    leprosy { false }
    tuberculosis { false }
    avc_stroke { false }
    had_heart_attack { false }
    had_heart_disease { false }
    recently_hospitalized { false }
    recently_hospitalized_cause { "MyText" }
    mental_issue { false }
    integrative_practices { false }
    medicinal_plants { false }
    medicinal_plants_used { "MyText" }
    company { nil }
    slug { "MyString" }
  end
end
