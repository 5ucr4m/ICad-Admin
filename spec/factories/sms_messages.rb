# frozen_string_literal: true

FactoryBot.define do
  factory :sms_message do
    date_sent { '2019-10-17 09:54:56' }
    number { 1 }
    status { 1 }
    sms_schedule { nil }
    slug { 'MyString' }
    company { nil }
  end
end
