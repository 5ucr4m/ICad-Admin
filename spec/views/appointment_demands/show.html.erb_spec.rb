require 'rails_helper'

RSpec.describe("appointment_demands/show", type: :view) do
  before(:each) do
    @appointment_demand = assign(:appointment_demand, AppointmentDemand.create!(
      family_member: nil,
      health_professional: nil,
      manage_medicine: false,
      curative: false,
      appointment_demand: false,
      initial_listening: false,
      examination: false,
      nebulization: false,
      dentistry: false,
      procedures: false,
      vaccine: false,
      company: nil,
      ip: "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Ip/))
  end
end
