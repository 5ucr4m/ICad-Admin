require 'rails_helper'

RSpec.describe("patient_records/index", type: :view) do
  before(:each) do
    assign(:patient_records, [
      PatientRecord.create!(
        appointment_booking: nil,
        appointment_demand: nil,
        appointment_reason: nil,
        appointment_brief: "MyText",
        cephalic_perimeter: "cephalic Perimeter",
        weight: "Weight",
        height: "Height",
        imc: "Imc",
        calf_perimeter: "Calf Perimeter",
        blood_pressure: "Blood Pressure",
        blood_pressure_to: "Blood Pressure To",
        respiratory_rate: "Respiratory Rate",
        heart_rate: "Heart Rate",
        temperature: "Temperature",
        saturation: "Saturation",
        capillary_blood: "Capillary Blood",
        collected_time: nil,
        risk_vulnerability: 2,
        release_citizen: false,
        patient_record: nil,
        other_appointment_booking: nil,
        user: nil,
        slug: "Slug",
        company: nil,
        ip: "Ip"
      ),
      PatientRecord.create!(
        appointment_booking: nil,
        appointment_demand: nil,
        appointment_reason: nil,
        appointment_brief: "MyText",
        cephalic_perimeter: "cephalic Perimeter",
        weight: "Weight",
        height: "Height",
        imc: "Imc",
        calf_perimeter: "Calf Perimeter",
        blood_pressure: "Blood Pressure",
        blood_pressure_to: "Blood Pressure To",
        respiratory_rate: "Respiratory Rate",
        heart_rate: "Heart Rate",
        temperature: "Temperature",
        saturation: "Saturation",
        capillary_blood: "Capillary Blood",
        collected_time: nil,
        risk_vulnerability: 2,
        release_citizen: false,
        patient_record: nil,
        other_appointment_booking: nil,
        user: nil,
        slug: "Slug",
        company: nil,
        ip: "Ip"
      ),
    ])
  end

  it "renders a list of patient_records" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "cephalic Perimeter".to_s, count: 2
    assert_select "tr>td", text: "Weight".to_s, count: 2
    assert_select "tr>td", text: "Height".to_s, count: 2
    assert_select "tr>td", text: "Imc".to_s, count: 2
    assert_select "tr>td", text: "Calf Perimeter".to_s, count: 2
    assert_select "tr>td", text: "Blood Pressure".to_s, count: 2
    assert_select "tr>td", text: "Blood Pressure To".to_s, count: 2
    assert_select "tr>td", text: "Respiratory Rate".to_s, count: 2
    assert_select "tr>td", text: "Heart Rate".to_s, count: 2
    assert_select "tr>td", text: "Temperature".to_s, count: 2
    assert_select "tr>td", text: "Saturation".to_s, count: 2
    assert_select "tr>td", text: "Capillary Blood".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Ip".to_s, count: 2
  end
end
