require 'rails_helper'

RSpec.describe "vaccination_campaigns/edit", type: :view do
  before(:each) do
    @vaccination_campaign = assign(:vaccination_campaign, VaccinationCampaign.create!(
      :title => "MyString",
      :description => "MyText",
      :vaccine => nil,
      :child => false,
      :woman => false,
      :age_initial => 1,
      :age_end => 1,
      :company => nil,
      :slug => "MyString"
    ))
  end

  it "renders the edit vaccination_campaign form" do
    render

    assert_select "form[action=?][method=?]", vaccination_campaign_path(@vaccination_campaign), "post" do

      assert_select "input[name=?]", "vaccination_campaign[title]"

      assert_select "textarea[name=?]", "vaccination_campaign[description]"

      assert_select "input[name=?]", "vaccination_campaign[vaccine_id]"

      assert_select "input[name=?]", "vaccination_campaign[child]"

      assert_select "input[name=?]", "vaccination_campaign[woman]"

      assert_select "input[name=?]", "vaccination_campaign[age_initial]"

      assert_select "input[name=?]", "vaccination_campaign[age_end]"

      assert_select "input[name=?]", "vaccination_campaign[company_id]"

      assert_select "input[name=?]", "vaccination_campaign[slug]"
    end
  end
end
