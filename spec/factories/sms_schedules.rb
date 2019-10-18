# frozen_string_literal: true

FactoryBot.define do
  factory :sms_schedule do
    scheduled_date { '2019-10-17 09:54:24' }
    message { 'MyText' }
    group { 1 }
    status { 1 }
    slug { 'MyString' }
    company { nil }
  end
end
