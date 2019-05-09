require 'rails_helper'

RSpec.describe "health_professionals/edit", type: :view do
  before(:each) do
    @health_professional = assign(:health_professional, HealthProfessional.create!(
      :cns_code => "MyString",
      :registry => nil,
      :health_establishment => nil,
      :professional_team => nil,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders the edit health_professional form" do
    render

    assert_select "form[action=?][method=?]", health_professional_path(@health_professional), "post" do

      assert_select "input[name=?]", "health_professional[cns_code]"

      assert_select "input[name=?]", "health_professional[registry_id]"

      assert_select "input[name=?]", "health_professional[health_establishment_id]"

      assert_select "input[name=?]", "health_professional[professional_team_id]"

      assert_select "input[name=?]", "health_professional[company_id]"

      assert_select "input[name=?]", "health_professional[slug]"
    end
  end
end
