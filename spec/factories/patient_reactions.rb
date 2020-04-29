FactoryBot.define do
  factory :patient_reaction do
    family_member { nil }
    reaction { nil }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 00:32:01" }
    ip { "MyString" }
  end
end
