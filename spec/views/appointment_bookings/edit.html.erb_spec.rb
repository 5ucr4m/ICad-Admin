require 'rails_helper'

RSpec.describe "appointment_bookings/edit", type: :view do
  before(:each) do
    @appointment_booking = assign(:appointment_booking, AppointmentBooking.create!(
      :health_professional => nil,
      :family_member => nil,
      :observation => "MyText",
      :phone => "MyString",
      :medical_procedure => nil,
      :slug => "MyString",
      :company => nil,
      :ip => "MyString"
    ))
  end

  it "renders the edit appointment_booking form" do
    render

    assert_select "form[action=?][method=?]", appointment_booking_path(@appointment_booking), "post" do

      assert_select "input[name=?]", "appointment_booking[health_professional_id]"

      assert_select "input[name=?]", "appointment_booking[family_member_id]"

      assert_select "textarea[name=?]", "appointment_booking[observation]"

      assert_select "input[name=?]", "appointment_booking[phone]"

      assert_select "input[name=?]", "appointment_booking[medical_procedure_id]"

      assert_select "input[name=?]", "appointment_booking[slug]"

      assert_select "input[name=?]", "appointment_booking[company_id]"

      assert_select "input[name=?]", "appointment_booking[ip]"
    end
  end
end
