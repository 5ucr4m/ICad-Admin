require 'rails_helper'

RSpec.describe "families/index", type: :view do
  before(:each) do
    assign(:families, [
      Family.create!(
        :home_registration => nil,
        :responsible_cns_number => "Responsible Cns Number",
        :members_quantity => 2,
        :handbook_number => "Handbook Number",
        :family_income_cents => 3,
        :moving => false,
        :company => nil,
        :slug => "Slug"
      ),
      Family.create!(
        :home_registration => nil,
        :responsible_cns_number => "Responsible Cns Number",
        :members_quantity => 2,
        :handbook_number => "Handbook Number",
        :family_income_cents => 3,
        :moving => false,
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of families" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Responsible Cns Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Handbook Number".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
