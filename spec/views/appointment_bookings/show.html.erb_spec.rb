require 'rails_helper'

RSpec.describe "appointment_bookings/show", type: :view do
  before(:each) do
    @appointment_booking = assign(:appointment_booking, AppointmentBooking.create!(
      :health_professional => nil,
      :family_member => nil,
      :observation => "MyText",
      :phone => "Phone",
      :medical_procedure => nil,
      :slug => "Slug",
      :company => nil,
      :ip => "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Ip/)
  end
end
