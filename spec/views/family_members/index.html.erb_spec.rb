require 'rails_helper'

RSpec.describe "family_members/index", type: :view do
  before(:each) do
    assign(:family_members, [
      FamilyMember.create!(
        :family => nil,
        :social_name => "Social Name",
        :city => nil,
        :unknown_mother => false,
        :mother_name => "Mother Name",
        :email => "Email",
        :nationality => nil,
        :name => "Name",
        :cns_number => "Cns Number",
        :cns_responsible => "Cns Responsible",
        :phone => "Phone",
        :pis_pasep_number => "Pis Pasep Number",
        :birth_country => nil,
        :race => nil,
        :gender => nil,
        :responsible => false,
        :ethnicity => nil,
        :unknown_father => false,
        :father_name => "Father Name",
        :naturalize_decree => "Naturalize Decree",
        :micro_area => "Micro Area",
        :out_area => false,
        :company => nil,
        :slug => "Slug"
      ),
      FamilyMember.create!(
        :family => nil,
        :social_name => "Social Name",
        :city => nil,
        :unknown_mother => false,
        :mother_name => "Mother Name",
        :email => "Email",
        :nationality => nil,
        :name => "Name",
        :cns_number => "Cns Number",
        :cns_responsible => "Cns Responsible",
        :phone => "Phone",
        :pis_pasep_number => "Pis Pasep Number",
        :birth_country => nil,
        :race => nil,
        :gender => nil,
        :responsible => false,
        :ethnicity => nil,
        :unknown_father => false,
        :father_name => "Father Name",
        :naturalize_decree => "Naturalize Decree",
        :micro_area => "Micro Area",
        :out_area => false,
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of family_members" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Social Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Mother Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cns Number".to_s, :count => 2
    assert_select "tr>td", :text => "Cns Responsible".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Pis Pasep Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Father Name".to_s, :count => 2
    assert_select "tr>td", :text => "Naturalize Decree".to_s, :count => 2
    assert_select "tr>td", :text => "Micro Area".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
