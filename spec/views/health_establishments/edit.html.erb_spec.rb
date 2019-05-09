require 'rails_helper'

RSpec.describe "health_establishments/edit", type: :view do
  before(:each) do
    @health_establishment = assign(:health_establishment, HealthEstablishment.create!(
      :cnes_code => "MyString",
      :unit_code => "MyString",
      :registry => nil,
      :manager => nil,
      :unit_type => nil,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders the edit health_establishment form" do
    render

    assert_select "form[action=?][method=?]", health_establishment_path(@health_establishment), "post" do

      assert_select "input[name=?]", "health_establishment[cnes_code]"

      assert_select "input[name=?]", "health_establishment[unit_code]"

      assert_select "input[name=?]", "health_establishment[registry_id]"

      assert_select "input[name=?]", "health_establishment[manager_id]"

      assert_select "input[name=?]", "health_establishment[unit_type_id]"

      assert_select "input[name=?]", "health_establishment[company_id]"

      assert_select "input[name=?]", "health_establishment[slug]"
    end
  end
end
