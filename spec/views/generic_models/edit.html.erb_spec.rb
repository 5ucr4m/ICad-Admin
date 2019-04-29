require 'rails_helper'

RSpec.describe "generic_models/edit", type: :view do
  before(:each) do
    @generic_model = assign(:generic_model, GenericModel.create!(
      :name => "MyString",
      :description => "MyString",
      :reference => "MyString",
      :generic_field => "MyString",
      :generic_class => "MyString",
      :generic_model => nil,
      :slug => "MyString"
    ))
  end

  it "renders the edit generic_model form" do
    render

    assert_select "form[action=?][method=?]", generic_model_path(@generic_model), "post" do

      assert_select "input[name=?]", "generic_model[name]"

      assert_select "input[name=?]", "generic_model[description]"

      assert_select "input[name=?]", "generic_model[reference]"

      assert_select "input[name=?]", "generic_model[generic_field]"

      assert_select "input[name=?]", "generic_model[generic_class]"

      assert_select "input[name=?]", "generic_model[generic_model_id]"

      assert_select "input[name=?]", "generic_model[slug]"
    end
  end
end
