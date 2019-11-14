# frozen_string_literal: true

FactoryBot.define do
  factory :role_permission do
    role { nil }
    permission { nil }
    slug { 'MyString' }
    company { nil }
  end
end
