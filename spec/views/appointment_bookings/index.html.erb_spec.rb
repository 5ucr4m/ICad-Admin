require 'rails_helper'

RSpec.describe "appointment_bookings/index", type: :view do
  before(:each) do
    assign(:appointment_bookings, [
      AppointmentBooking.create!(
        :health_professional => nil,
        :family_member => nil,
        :start_hour => "Start Hour",
        :end_hour => "End Hour",
        :observation => "MyText",
        :phone => "Phone",
        :medical_procedure => nil,
        :slug => "Slug",
        :company => nil,
        :status => 2,
        :priority => 3,
        :priority_order => 4,
        :ip => "Ip"
      ),
      AppointmentBooking.create!(
        :health_professional => nil,
        :family_member => nil,
        :start_hour => "Start Hour",
        :end_hour => "End Hour",
        :observation => "MyText",
        :phone => "Phone",
        :medical_procedure => nil,
        :slug => "Slug",
        :company => nil,
        :status => 2,
        :priority => 3,
        :priority_order => 4,
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of appointment_bookings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Start Hour".to_s, :count => 2
    assert_select "tr>td", :text => "End Hour".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
