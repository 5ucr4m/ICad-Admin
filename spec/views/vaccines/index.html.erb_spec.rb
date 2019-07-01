require 'rails_helper'

RSpec.describe "vaccines/index", type: :view do
  before(:each) do
    assign(:vaccines, [
      Vaccine.create!(
        :description => "Description",
        :immunobiological => nil,
        :vaccination_strategy => nil,
        :dose => nil,
        :lot_number => "Lot Number",
        :manufacturer => "Manufacturer",
        :company => nil,
        :slug => "Slug"
      ),
      Vaccine.create!(
        :description => "Description",
        :immunobiological => nil,
        :vaccination_strategy => nil,
        :dose => nil,
        :lot_number => "Lot Number",
        :manufacturer => "Manufacturer",
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of vaccines" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Lot Number".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
