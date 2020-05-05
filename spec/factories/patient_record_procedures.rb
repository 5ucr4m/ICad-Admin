FactoryBot.define do
  factory :patient_record_procedure do
    patient_record { nil }
    procedure_performed { nil }
    company { nil }
    slug { "MyString" }
    discarded_at { "2020-03-11 02:19:50" }
    ip { "MyString" }
  end
end
