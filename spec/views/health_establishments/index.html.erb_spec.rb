require 'rails_helper'

RSpec.describe "health_establishments/index", type: :view do
  before(:each) do
    assign(:health_establishments, [
      HealthEstablishment.create!(
        :cnes_code => "Cnes Code",
        :unit_code => "Unit Code",
        :registry => nil,
        :manager => nil,
        :unit_type => nil,
        :company => nil,
        :slug => "Slug"
      ),
      HealthEstablishment.create!(
        :cnes_code => "Cnes Code",
        :unit_code => "Unit Code",
        :registry => nil,
        :manager => nil,
        :unit_type => nil,
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of health_establishments" do
    render
    assert_select "tr>td", :text => "Cnes Code".to_s, :count => 2
    assert_select "tr>td", :text => "Unit Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
