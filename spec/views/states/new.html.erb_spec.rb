require 'rails_helper'

RSpec.describe "states/new", type: :view do
  before(:each) do
    assign(:state, State.new(
      :name => "MyString",
      :abbreviation => "MyString",
      :code => "MyString",
      :reference => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do

      assert_select "input[name=?]", "state[name]"

      assert_select "input[name=?]", "state[abbreviation]"

      assert_select "input[name=?]", "state[code]"

      assert_select "input[name=?]", "state[reference]"

      assert_select "input[name=?]", "state[slug]"
    end
  end
end
