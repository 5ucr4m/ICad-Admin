require 'rails_helper'

RSpec.describe "vaccines/new", type: :view do
  before(:each) do
    assign(:vaccine, Vaccine.new(
      :description => "MyString",
      :immunobiological => nil,
      :vaccination_strategy => nil,
      :dose => nil,
      :lot_number => "MyString",
      :manufacturer => "MyString",
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders new vaccine form" do
    render

    assert_select "form[action=?][method=?]", vaccines_path, "post" do

      assert_select "input[name=?]", "vaccine[description]"

      assert_select "input[name=?]", "vaccine[immunobiological_id]"

      assert_select "input[name=?]", "vaccine[vaccination_strategy_id]"

      assert_select "input[name=?]", "vaccine[dose_id]"

      assert_select "input[name=?]", "vaccine[lot_number]"

      assert_select "input[name=?]", "vaccine[manufacturer]"

      assert_select "input[name=?]", "vaccine[company_id]"

      assert_select "input[name=?]", "vaccine[slug]"
    end
  end
end
