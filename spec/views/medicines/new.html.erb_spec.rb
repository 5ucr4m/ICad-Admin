require 'rails_helper'

RSpec.describe("medicines/new", type: :view) do
  before(:each) do
    assign(:medicine, Medicine.new(
      name: "MyString",
      substance: "MyString",
      laboratory: "MyString",
      laboratory_registry: "MyString",
      ggrem_code: "MyString",
      registry: "MyString",
      ean_one: "MyString",
      ean_two: "MyString",
      ean_three: "MyString",
      presentation: "MyString",
      therapeutic_class: nil,
      product_type: nil,
      stripe: nil,
      slug: "MyString",
      company: nil,
      ip: "MyString"
    ))
  end

  it "renders new medicine form" do
    render

    assert_select "form[action=?][method=?]", medicines_path, "post" do
      assert_select "input[name=?]", "medicine[name]"

      assert_select "input[name=?]", "medicine[substance]"

      assert_select "input[name=?]", "medicine[laboratory]"

      assert_select "input[name=?]", "medicine[laboratory_registry]"

      assert_select "input[name=?]", "medicine[ggrem_code]"

      assert_select "input[name=?]", "medicine[registry]"

      assert_select "input[name=?]", "medicine[ean_one]"

      assert_select "input[name=?]", "medicine[ean_two]"

      assert_select "input[name=?]", "medicine[ean_three]"

      assert_select "input[name=?]", "medicine[presentation]"

      assert_select "input[name=?]", "medicine[therapeutic_class_id]"

      assert_select "input[name=?]", "medicine[product_type_id]"

      assert_select "input[name=?]", "medicine[stripe_id]"

      assert_select "input[name=?]", "medicine[slug]"

      assert_select "input[name=?]", "medicine[company_id]"

      assert_select "input[name=?]", "medicine[ip]"
    end
  end
end
