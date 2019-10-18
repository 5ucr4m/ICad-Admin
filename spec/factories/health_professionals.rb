# frozen_string_literal: true

FactoryBot.define do
  factory :health_professional do
    cns_code { 'MyString' }
    cbo_code { nil }
    full_name { 'MyString' }
    federal_registry { 'MyString' }
    state_registry { 'MyString' }
    professional_team { nil }
    company { nil }
    slug { 'MyString' }
  end
end
