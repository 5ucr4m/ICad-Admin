require 'rails_helper'

RSpec.describe "home_visit_registrations/index", type: :view do
  before(:each) do
    assign(:home_visit_registrations, [
      HomeVisitRegistration.create!(
        :family_member => nil,
        :uuid => "Uuid",
        :tp_cds_origin => "Tp Cds Origin",
        :company => nil,
        :slug => "Slug"
      ),
      HomeVisitRegistration.create!(
        :family_member => nil,
        :uuid => "Uuid",
        :tp_cds_origin => "Tp Cds Origin",
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of home_visit_registrations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Uuid".to_s, :count => 2
    assert_select "tr>td", :text => "Tp Cds Origin".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
