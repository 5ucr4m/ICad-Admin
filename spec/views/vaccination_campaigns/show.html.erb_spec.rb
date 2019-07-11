require 'rails_helper'

RSpec.describe "vaccination_campaigns/show", type: :view do
  before(:each) do
    @vaccination_campaign = assign(:vaccination_campaign, VaccinationCampaign.create!(
      :title => "Title",
      :description => "MyText",
      :vaccine => nil,
      :child => false,
      :woman => false,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
