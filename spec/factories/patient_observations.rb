FactoryBot.define do
  factory :patient_observation do
    family_member { nil }
    observation { "MyText" }
    confidential { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 00:37:29" }
    ip { "MyString" }
  end
end
