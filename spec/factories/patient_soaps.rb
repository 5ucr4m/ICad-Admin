FactoryBot.define do
  factory :patient_soap do
    family_member { nil }
    subject { "MyText" }
    objective { "MyText" }
    evaluation { "MyText" }
    plan { "MyText" }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 20:27:16" }
    ip { "MyString" }
  end
end
