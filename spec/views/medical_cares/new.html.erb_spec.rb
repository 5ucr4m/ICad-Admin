require 'rails_helper'

RSpec.describe "medical_cares/new", type: :view do
  before(:each) do
    assign(:medical_care, MedicalCare.new(
      :appointment_booking => nil,
      :appointment_demand => nil,
      :appointment_reason => nil,
      :appointment_brief => "MyText",
      :cephalic_perimeter => "MyString",
      :weight => "MyString",
      :height => "MyString",
      :imc => "MyString",
      :calf_perimeter => "MyString",
      :blood_pressure => "MyString",
      :blood_pressure_to => "MyString",
      :respiratory_rate => "MyString",
      :heart_rate => "MyString",
      :temperature => "MyString",
      :saturation => "MyString",
      :capillary_blood => "MyString",
      :collected_time => nil,
      :risk_vulnerability => 1,
      :release_citizen => false,
      :medical_care => nil,
      :other_appointment_booking => nil,
      :user => nil,
      :slug => "MyString",
      :company => nil,
      :ip => "MyString"
    ))
  end

  it "renders new medical_care form" do
    render

    assert_select "form[action=?][method=?]", medical_cares_path, "post" do

      assert_select "input[name=?]", "medical_care[appointment_booking_id]"

      assert_select "input[name=?]", "medical_care[appointment_demand_id]"

      assert_select "input[name=?]", "medical_care[appointment_reason_id]"

      assert_select "textarea[name=?]", "medical_care[appointment_brief]"

      assert_select "input[name=?]", "medical_care[cephalic_perimeter]"

      assert_select "input[name=?]", "medical_care[weight]"

      assert_select "input[name=?]", "medical_care[height]"

      assert_select "input[name=?]", "medical_care[imc]"

      assert_select "input[name=?]", "medical_care[calf_perimeter]"

      assert_select "input[name=?]", "medical_care[blood_pressure]"

      assert_select "input[name=?]", "medical_care[blood_pressure_to]"

      assert_select "input[name=?]", "medical_care[respiratory_rate]"

      assert_select "input[name=?]", "medical_care[heart_rate]"

      assert_select "input[name=?]", "medical_care[temperature]"

      assert_select "input[name=?]", "medical_care[saturation]"

      assert_select "input[name=?]", "medical_care[capillary_blood]"

      assert_select "input[name=?]", "medical_care[collected_time_id]"

      assert_select "input[name=?]", "medical_care[risk_vulnerability]"

      assert_select "input[name=?]", "medical_care[release_citizen]"

      assert_select "input[name=?]", "medical_care[medical_care_id]"

      assert_select "input[name=?]", "medical_care[other_appointment_booking_id]"

      assert_select "input[name=?]", "medical_care[user_id]"

      assert_select "input[name=?]", "medical_care[slug]"

      assert_select "input[name=?]", "medical_care[company_id]"

      assert_select "input[name=?]", "medical_care[ip]"
    end
  end
end
