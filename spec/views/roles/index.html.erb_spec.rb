require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        :name => "Name",
        :description => "Description",
        :icon => "Icon",
        :model_reference => "Model Reference",
        :action_reference => "Action Reference",
        :url_reference => "Url Reference",
        :role => nil,
        :app_module => nil,
        :slug => "Slug"
      ),
      Role.create!(
        :name => "Name",
        :description => "Description",
        :icon => "Icon",
        :model_reference => "Model Reference",
        :action_reference => "Action Reference",
        :url_reference => "Url Reference",
        :role => nil,
        :app_module => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
    assert_select "tr>td", :text => "Model Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Action Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Url Reference".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
