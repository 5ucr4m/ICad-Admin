FactoryBot.define do
  factory :patient_soap_certificate do
    patient_soap { nil }
    blank_certificate { false }
    default_certificate { false }
    maternity_license { false }
    description { "MyText" }
    issue_date { "2020-05-11 02:37:18" }
    cid_code { nil }
    print_cid_code { false }
    days { 1 }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-05-11 02:37:18" }
    ip { "MyString" }
  end
end
