require 'rails_helper'

RSpec.describe "vaccinations/new", type: :view do
  before(:each) do
    assign(:vaccination, Vaccination.new(
      :uuid => "MyString",
      :tp_cds_origin => 1,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders new vaccination form" do
    render

    assert_select "form[action=?][method=?]", vaccinations_path, "post" do

      assert_select "input[name=?]", "vaccination[uuid]"

      assert_select "input[name=?]", "vaccination[tp_cds_origin]"

      assert_select "input[name=?]", "vaccination[company_id]"

      assert_select "input[name=?]", "vaccination[slug]"
    end
  end
end
