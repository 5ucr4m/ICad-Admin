# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { 'MyString' }
    description { 'MyText' }
    role_type { 1 }
    admin { false }
    slug { 'MyString' }
  end
end
