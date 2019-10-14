# frozen_string_literal: true

FactoryBot.define do
  factory :vaccination_campaign do
    title { 'MyString' }
    description { 'MyString' }
    newborn { false }
    child { false }
    woman { false }
    period_start { '2019-10-02' }
    period_end { '2019-10-02' }
    age_initial { 1 }
    age_end { 1 }
    company { nil }
    slug { 'MyString' }
  end
end
