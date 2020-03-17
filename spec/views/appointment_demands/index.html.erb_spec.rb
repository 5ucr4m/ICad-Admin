require 'rails_helper'

RSpec.describe "appointment_demands/index", type: :view do
  before(:each) do
    assign(:appointment_demands, [
      AppointmentDemand.create!(
        :family_member => nil,
        :health_professional => nil,
        :manage_medicine => false,
        :curative => false,
        :appointment_demand => false,
        :initial_listening => false,
        :examination => false,
        :nebulization => false,
        :dentistry => false,
        :procedures => false,
        :vaccine => false,
        :company => nil,
        :ip => "Ip"
      ),
      AppointmentDemand.create!(
        :family_member => nil,
        :health_professional => nil,
        :manage_medicine => false,
        :curative => false,
        :appointment_demand => false,
        :initial_listening => false,
        :examination => false,
        :nebulization => false,
        :dentistry => false,
        :procedures => false,
        :vaccine => false,
        :company => nil,
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of appointment_demands" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
