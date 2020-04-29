require 'rails_helper'

RSpec.describe("medical_cares/show", type: :view) do
  before(:each) do
    @medical_care = assign(:medical_care, MedicalCare.create!(
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
      medical_care: nil,
      other_appointment_booking: nil,
      user: nil,
      slug: "Slug",
      company: nil,
      ip: "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/cephalic Perimeter/))
    expect(rendered).to(match(/Weight/))
    expect(rendered).to(match(/Height/))
    expect(rendered).to(match(/Imc/))
    expect(rendered).to(match(/Calf Perimeter/))
    expect(rendered).to(match(/Blood Pressure/))
    expect(rendered).to(match(/Blood Pressure To/))
    expect(rendered).to(match(/Respiratory Rate/))
    expect(rendered).to(match(/Heart Rate/))
    expect(rendered).to(match(/Temperature/))
    expect(rendered).to(match(/Saturation/))
    expect(rendered).to(match(/Capillary Blood/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Ip/))
  end
end
