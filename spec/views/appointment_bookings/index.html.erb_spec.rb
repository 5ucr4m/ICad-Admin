require 'rails_helper'

RSpec.describe "appointment_bookings/index", type: :view do
  before(:each) do
    assign(:appointment_bookings, [
      AppointmentBooking.create!(
        :health_professional => nil,
        :family_member => nil,
        :observation => "MyText",
        :phone => "Phone",
        :medical_procedure => nil,
        :slug => "Slug",
        :company => nil,
        :ip => "Ip"
      ),
      AppointmentBooking.create!(
        :health_professional => nil,
        :family_member => nil,
        :observation => "MyText",
        :phone => "Phone",
        :medical_procedure => nil,
        :slug => "Slug",
        :company => nil,
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of appointment_bookings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
