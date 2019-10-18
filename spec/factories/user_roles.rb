# frozen_string_literal: true

FactoryBot.define do
  factory :user_role do
    user_company { nil }
    role { nil }
    slug { 'MyString' }
  end
end
