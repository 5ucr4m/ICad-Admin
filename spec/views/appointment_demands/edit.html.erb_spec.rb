require 'rails_helper'

RSpec.describe "appointment_demands/edit", type: :view do
  before(:each) do
    @appointment_demand = assign(:appointment_demand, AppointmentDemand.create!(
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
      :ip => "MyString"
    ))
  end

  it "renders the edit appointment_demand form" do
    render

    assert_select "form[action=?][method=?]", appointment_demand_path(@appointment_demand), "post" do

      assert_select "input[name=?]", "appointment_demand[family_member_id]"

      assert_select "input[name=?]", "appointment_demand[health_professional_id]"

      assert_select "input[name=?]", "appointment_demand[manage_medicine]"

      assert_select "input[name=?]", "appointment_demand[curative]"

      assert_select "input[name=?]", "appointment_demand[appointment_demand]"

      assert_select "input[name=?]", "appointment_demand[initial_listening]"

      assert_select "input[name=?]", "appointment_demand[examination]"

      assert_select "input[name=?]", "appointment_demand[nebulization]"

      assert_select "input[name=?]", "appointment_demand[dentistry]"

      assert_select "input[name=?]", "appointment_demand[procedures]"

      assert_select "input[name=?]", "appointment_demand[vaccine]"

      assert_select "input[name=?]", "appointment_demand[company_id]"

      assert_select "input[name=?]", "appointment_demand[ip]"
    end
  end
end
