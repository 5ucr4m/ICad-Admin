FactoryBot.define do
  factory :appointment_booking do
    health_professional { nil }
    family_member { nil }
    appointment_date { "2020-02-11" }
    start_hour { "2020-02-11 02:43:02" }
    end_hour { "2020-02-11 02:43:02" }
    observation { "MyText" }
    phone { "MyString" }
    medical_procedure { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-02-11 02:43:02" }
    ip { "MyString" }
  end
end
