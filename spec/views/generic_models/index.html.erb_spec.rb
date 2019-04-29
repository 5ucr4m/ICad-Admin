require 'rails_helper'

RSpec.describe "generic_models/index", type: :view do
  before(:each) do
    assign(:generic_models, [
      GenericModel.create!(
        :name => "Name",
        :description => "Description",
        :reference => "Reference",
        :generic_field => "Generic Field",
        :generic_class => "Generic Class",
        :generic_model => nil,
        :slug => "Slug"
      ),
      GenericModel.create!(
        :name => "Name",
        :description => "Description",
        :reference => "Reference",
        :generic_field => "Generic Field",
        :generic_class => "Generic Class",
        :generic_model => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of generic_models" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Generic Field".to_s, :count => 2
    assert_select "tr>td", :text => "Generic Class".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
