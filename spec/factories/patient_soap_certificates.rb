FactoryBot.define do
  factory :patient_soap_certificate do
    description { "MyText" }
    issue_date_hour { "2020-04-03 21:48:21" }
    cid_code { nil }
    days { 1 }
    print_cid_code { false }
    maternity_leave { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-03 21:48:21" }
    ip { "MyString" }
  end
end
