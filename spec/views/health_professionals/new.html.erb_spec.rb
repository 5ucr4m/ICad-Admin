require 'rails_helper'

RSpec.describe "health_professionals/new", type: :view do
  before(:each) do
    assign(:health_professional, HealthProfessional.new(
      :cns_code => "MyString",
      :cbo_code => "MyString",
      :registry => nil,
      :health_establishment => nil,
      :professional_team => nil,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders new health_professional form" do
    render

    assert_select "form[action=?][method=?]", health_professionals_path, "post" do

      assert_select "input[name=?]", "health_professional[cns_code]"

      assert_select "input[name=?]", "health_professional[cbo_code]"

      assert_select "input[name=?]", "health_professional[registry_id]"

      assert_select "input[name=?]", "health_professional[health_establishment_id]"

      assert_select "input[name=?]", "health_professional[professional_team_id]"

      assert_select "input[name=?]", "health_professional[company_id]"

      assert_select "input[name=?]", "health_professional[slug]"
    end
  end
end
