require 'rails_helper'

RSpec.describe "roles/new", type: :view do
  before(:each) do
    assign(:role, Role.new(
      :name => "MyString",
      :description => "MyString",
      :icon => "MyString",
      :model_reference => "MyString",
      :action_reference => "MyString",
      :url_reference => "MyString",
      :role => nil,
      :app_module => nil,
      :slug => "MyString"
    ))
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", roles_path, "post" do

      assert_select "input[name=?]", "role[name]"

      assert_select "input[name=?]", "role[description]"

      assert_select "input[name=?]", "role[icon]"

      assert_select "input[name=?]", "role[model_reference]"

      assert_select "input[name=?]", "role[action_reference]"

      assert_select "input[name=?]", "role[url_reference]"

      assert_select "input[name=?]", "role[role_id]"

      assert_select "input[name=?]", "role[app_module_id]"

      assert_select "input[name=?]", "role[slug]"
    end
  end
end
