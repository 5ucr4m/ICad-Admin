require 'rails_helper'

RSpec.describe "citizens/new", type: :view do
  before(:each) do
    assign(:citizen, Citizen.new(
      :registry => nil,
      :gender => nil,
      :race => nil,
      :birth_state => nil,
      :nationality => nil,
      :birth_country => nil,
      :mother_name => "MyString",
      :sus_card_number => "MyString",
      :pis_pasep_number => "MyString",
      :unknown_mother_name => false,
      :responsible_person => nil,
      :health_condition => nil,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders new citizen form" do
    render

    assert_select "form[action=?][method=?]", citizens_path, "post" do

      assert_select "input[name=?]", "citizen[registry_id]"

      assert_select "input[name=?]", "citizen[gender_id]"

      assert_select "input[name=?]", "citizen[race_id]"

      assert_select "input[name=?]", "citizen[birth_state_id]"

      assert_select "input[name=?]", "citizen[nationality_id]"

      assert_select "input[name=?]", "citizen[birth_country_id]"

      assert_select "input[name=?]", "citizen[mother_name]"

      assert_select "input[name=?]", "citizen[sus_card_number]"

      assert_select "input[name=?]", "citizen[pis_pasep_number]"

      assert_select "input[name=?]", "citizen[unknown_mother_name]"

      assert_select "input[name=?]", "citizen[responsible_person_id]"

      assert_select "input[name=?]", "citizen[health_condition_id]"

      assert_select "input[name=?]", "citizen[company_id]"

      assert_select "input[name=?]", "citizen[slug]"
    end
  end
end
