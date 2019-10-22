require 'rails_helper'

RSpec.describe "vaccination_campaigns/index", type: :view do
  before(:each) do
    assign(:vaccination_campaigns, [
      VaccinationCampaign.create!(
        :title => "Title",
        :description => "Description",
        :age_initial => 2,
        :age_end => 3,
        :company => nil,
        :slug => "Slug"
      ),
      VaccinationCampaign.create!(
        :title => "Title",
        :description => "Description",
        :age_initial => 2,
        :age_end => 3,
        :company => nil,
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of vaccination_campaigns" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
