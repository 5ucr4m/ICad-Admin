FactoryBot.define do
  factory :patient_background do
    family_member { nil }
    pregnant_type { 1 }
    childbirth { 1 }
    gestational_weeks { 1 }
    gestational_days { 1 }
    one_minute { 1 }
    five_minute { 1 }
    ten_minute { 1 }
    baby_weight { "MyString" }
    baby_height { "MyString" }
    baby_cephalic_perimeter { "MyString" }
    surgeries { "MyText" }
    hospitalizations { "MyText" }
    observations { "MyText" }
    previous_pregnancy { "MyString" }
    abortion { "MyString" }
    childbirth { "MyString" }
    vaginal_childbirth { "MyString" }
    home_childbirth { "MyString" }
    cesarean { "MyString" }
    born_live { "MyString" }
    live { "MyString" }
    born_dead { "MyString" }
    rn_minus { "MyString" }
    rm_plus { "MyString" }
    dead_first_week { "MyString" }
    dead_after_week { "MyString" }
    last_year_pregnancy { false }
    user { nil }
    slug { "MyString" }
    company { nil }
    discarded_at { "2020-04-04 00:22:03" }
    ip { "MyString" }
  end
end
