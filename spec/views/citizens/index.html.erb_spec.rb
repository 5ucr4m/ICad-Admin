require 'rails_helper'

RSpec.describe "citizens/index", type: :view do
  before(:each) do
    assign(:citizens, [
      Citizen.create!(
        :registry => nil,
        :gender => nil,
        :race => nil,
        :birth_state => nil,
        :nationality => nil,
        :birth_country => nil,
        :mother_name => "Mother Name",
        :sus_card_number => "Sus Card Number",
        :pis_pasep_number => "Pis Pasep Number",
        :unknown_mother_name => false,
        :responsible_person => nil,
        :health_condition => nil,
        :company => nil,
        :slug => "Slug"
      ),
      Citizen.create!(
        :registry => nil,
        :gender => nil,
        :race => nil,
        :birth_state => nil,
        :nationality => nil,
        :birth_country => nil,
        :mother_name => "Mother Name",
        :sus_card_number => "Sus Card Number",
        :pis_pasep_number => "Pis Pasep Number",
        :unknown_mother_name => false,
        :responsible_person => nil,
        :health_condition => nil,
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of citizens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Mother Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sus Card Number".to_s, :count => 2
    assert_select "tr>td", :text => "Pis Pasep Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
