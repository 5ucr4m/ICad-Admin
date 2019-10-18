# frozen_string_literal: true

FactoryBot.define do
  factory :professional_team do
    name { 'MyString' }
    code { 'MyString' }
    active { false }
    health_establishment { nil }
    slug { 'MyString' }
    company { nil }
  end
end
