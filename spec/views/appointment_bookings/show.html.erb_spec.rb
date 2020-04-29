require 'rails_helper'

RSpec.describe("appointment_bookings/show", type: :view) do
  before(:each) do
    @appointment_booking = assign(:appointment_booking, AppointmentBooking.create!(
      health_professional: nil,
      family_member: nil,
      start_hour: "Start Hour",
      end_hour: "End Hour",
      observation: "MyText",
      phone: "Phone",
      medical_procedure: nil,
      slug: "Slug",
      company: nil,
      status: 2,
      priority: 3,
      priority_order: 4,
      ip: "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Start Hour/))
    expect(rendered).to(match(/End Hour/))
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/Phone/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/3/))
    expect(rendered).to(match(/4/))
    expect(rendered).to(match(/Ip/))
  end
end
