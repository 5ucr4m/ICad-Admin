require 'rails_helper'

RSpec.describe "appointment_bookings/new", type: :view do
  before(:each) do
    assign(:appointment_booking, AppointmentBooking.new(
      :health_professional => nil,
      :family_member => nil,
      :start_hour => "MyString",
      :end_hour => "MyString",
      :observation => "MyText",
      :phone => "MyString",
      :medical_procedure => nil,
      :slug => "MyString",
      :company => nil,
      :status => 1,
      :priority => 1,
      :priority_order => 1,
      :ip => "MyString"
    ))
  end

  it "renders new appointment_booking form" do
    render

    assert_select "form[action=?][method=?]", appointment_bookings_path, "post" do

      assert_select "input[name=?]", "appointment_booking[health_professional_id]"

      assert_select "input[name=?]", "appointment_booking[family_member_id]"

      assert_select "input[name=?]", "appointment_booking[start_hour]"

      assert_select "input[name=?]", "appointment_booking[end_hour]"

      assert_select "textarea[name=?]", "appointment_booking[observation]"

      assert_select "input[name=?]", "appointment_booking[phone]"

      assert_select "input[name=?]", "appointment_booking[medical_procedure_id]"

      assert_select "input[name=?]", "appointment_booking[slug]"

      assert_select "input[name=?]", "appointment_booking[company_id]"

      assert_select "input[name=?]", "appointment_booking[status]"

      assert_select "input[name=?]", "appointment_booking[priority]"

      assert_select "input[name=?]", "appointment_booking[priority_order]"

      assert_select "input[name=?]", "appointment_booking[ip]"
    end
  end
end
