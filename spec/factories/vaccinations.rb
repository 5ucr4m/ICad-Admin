# frozen_string_literal: true

FactoryBot.define do
  factory :vaccination do
    uuid { 'MyString' }
    tp_cds_origin { 'MyString' }
    header_transport { nil }
    vaccination_campaign { nil }
    company { nil }
    slug { 'MyString' }
  end
end
