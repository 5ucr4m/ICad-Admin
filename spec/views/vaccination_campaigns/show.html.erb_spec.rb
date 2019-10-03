require 'rails_helper'

RSpec.describe "vaccination_campaigns/show", type: :view do
  before(:each) do
    @vaccination_campaign = assign(:vaccination_campaign, VaccinationCampaign.create!(
      :title => "Title",
      :description => "Description",
      :newborn => false,
      :child => false,
      :woman => false,
      :age_initial => 2,
      :age_end => 3,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
