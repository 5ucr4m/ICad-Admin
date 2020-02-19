require 'rails_helper'

RSpec.describe "appointment_bookings/new", type: :view do
  before(:each) do
    assign(:appointment_booking, AppointmentBooking.new(
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

  it "renders new appointment_booking form" do
    render

    assert_select "form[action=?][method=?]", appointment_bookings_path, "post" do

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
