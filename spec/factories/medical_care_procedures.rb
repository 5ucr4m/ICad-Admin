FactoryBot.define do
  factory :medical_care_procedure do
    medical_care { nil }
    procedure_performed { nil }
    company { nil }
    slug { "MyString" }
    discarded_at { "2020-03-11 02:19:50" }
    ip { "MyString" }
  end
end
