require 'rails_helper'

RSpec.describe "medicines/index", type: :view do
  before(:each) do
    assign(:medicines, [
      Medicine.create!(
        :substance => "Substance",
        :laboratory => "Laboratory",
        :laboratory_registry => "Laboratory Registry",
        :ggrem_code => "Ggrem Code",
        :registry => "Registry",
        :ean_one => "Ean One",
        :ean_two => "Ean Two",
        :ean_three => "Ean Three",
        :active_principle => "Active Principle",
        :therapeutic_class => nil,
        :product_type => nil,
        :stripe => nil,
        :slug => "Slug",
        :company => nil,
        :ip => "Ip"
      ),
      Medicine.create!(
        :substance => "Substance",
        :laboratory => "Laboratory",
        :laboratory_registry => "Laboratory Registry",
        :ggrem_code => "Ggrem Code",
        :registry => "Registry",
        :ean_one => "Ean One",
        :ean_two => "Ean Two",
        :ean_three => "Ean Three",
        :active_principle => "Active Principle",
        :therapeutic_class => nil,
        :product_type => nil,
        :stripe => nil,
        :slug => "Slug",
        :company => nil,
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of medicines" do
    render
    assert_select "tr>td", :text => "Substance".to_s, :count => 2
    assert_select "tr>td", :text => "Laboratory".to_s, :count => 2
    assert_select "tr>td", :text => "Laboratory Registry".to_s, :count => 2
    assert_select "tr>td", :text => "Ggrem Code".to_s, :count => 2
    assert_select "tr>td", :text => "Registry".to_s, :count => 2
    assert_select "tr>td", :text => "Ean One".to_s, :count => 2
    assert_select "tr>td", :text => "Ean Two".to_s, :count => 2
    assert_select "tr>td", :text => "Ean Three".to_s, :count => 2
    assert_select "tr>td", :text => "Active Principle".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
