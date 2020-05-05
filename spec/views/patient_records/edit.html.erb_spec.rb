require 'rails_helper'

RSpec.describe("patient_records/edit", type: :view) do
  before(:each) do
    @patient_record = assign(:patient_record, PatientRecord.create!(
      appointment_booking: nil,
      appointment_demand: nil,
      appointment_reason: nil,
      appointment_brief: "MyText",
      cephalic_perimeter: "MyString",
      weight: "MyString",
      height: "MyString",
      imc: "MyString",
      calf_perimeter: "MyString",
      blood_pressure: "MyString",
      blood_pressure_to: "MyString",
      respiratory_rate: "MyString",
      heart_rate: "MyString",
      temperature: "MyString",
      saturation: "MyString",
      capillary_blood: "MyString",
      collected_time: nil,
      risk_vulnerability: 1,
      release_citizen: false,
      patient_record: nil,
      other_appointment_booking: nil,
      user: nil,
      slug: "MyString",
      company: nil,
      ip: "MyString"
    ))
  end

  it "renders the edit patient_record form" do
    render

    assert_select "form[action=?][method=?]", patient_record_path(@patient_record), "post" do
      assert_select "input[name=?]", "patient_record[appointment_booking_id]"

      assert_select "input[name=?]", "patient_record[appointment_demand_id]"

      assert_select "input[name=?]", "patient_record[appointment_reason_id]"

      assert_select "textarea[name=?]", "patient_record[appointment_brief]"

      assert_select "input[name=?]", "patient_record[cephalic_perimeter]"

      assert_select "input[name=?]", "patient_record[weight]"

      assert_select "input[name=?]", "patient_record[height]"

      assert_select "input[name=?]", "patient_record[imc]"

      assert_select "input[name=?]", "patient_record[calf_perimeter]"

      assert_select "input[name=?]", "patient_record[blood_pressure]"

      assert_select "input[name=?]", "patient_record[blood_pressure_to]"

      assert_select "input[name=?]", "patient_record[respiratory_rate]"

      assert_select "input[name=?]", "patient_record[heart_rate]"

      assert_select "input[name=?]", "patient_record[temperature]"

      assert_select "input[name=?]", "patient_record[saturation]"

      assert_select "input[name=?]", "patient_record[capillary_blood]"

      assert_select "input[name=?]", "patient_record[collected_time_id]"

      assert_select "input[name=?]", "patient_record[risk_vulnerability]"

      assert_select "input[name=?]", "patient_record[release_citizen]"

      assert_select "input[name=?]", "patient_record[patient_record_id]"

      assert_select "input[name=?]", "patient_record[other_appointment_booking_id]"

      assert_select "input[name=?]", "patient_record[user_id]"

      assert_select "input[name=?]", "patient_record[slug]"

      assert_select "input[name=?]", "patient_record[company_id]"

      assert_select "input[name=?]", "patient_record[ip]"
    end
  end
end
