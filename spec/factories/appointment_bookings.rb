FactoryBot.define do
  factory :appointment_booking do
    health_professional { nil }
    family_member { nil }
    appointment_date { "2020-02-27" }
    start_hour { "MyString" }
    end_hour { "MyString" }
    observation { "MyText" }
    phone { "MyString" }
    medical_procedure { nil }
    slug { "MyString" }
    company { nil }
    status { 1 }
    priority { 1 }
    priority_order { 1 }
    discarded_at { "2020-02-27 01:52:39" }
    ip { "MyString" }
  end
end
