require 'rails_helper'

RSpec.describe("appointment_demands/new", type: :view) do
  before(:each) do
    assign(:appointment_demand, AppointmentDemand.new(
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
      ip: "MyString"
    ))
  end

  it "renders new appointment_demand form" do
    render

    assert_select "form[action=?][method=?]", appointment_demands_path, "post" do
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
