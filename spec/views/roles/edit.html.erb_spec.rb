require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      :name => "MyString",
      :description => "MyString",
      :icon => "MyString",
      :reference => "MyString",
      :url => "MyString",
      :role => nil,
      :app_module => nil,
      :slug => "MyString"
    ))
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do

      assert_select "input[name=?]", "role[name]"

      assert_select "input[name=?]", "role[description]"

      assert_select "input[name=?]", "role[icon]"

      assert_select "input[name=?]", "role[reference]"

      assert_select "input[name=?]", "role[url]"

      assert_select "input[name=?]", "role[role_id]"

      assert_select "input[name=?]", "role[app_module_id]"

      assert_select "input[name=?]", "role[slug]"
    end
  end
end
