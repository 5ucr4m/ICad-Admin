require 'rails_helper'

RSpec.describe "families/show", type: :view do
  before(:each) do
    @family = assign(:family, Family.create!(
      :home_registration => nil,
      :responsible_cns_number => "Responsible Cns Number",
      :members_quantity => 2,
      :handbook_number => "Handbook Number",
      :family_income_cents => 3,
      :moving => false,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Responsible Cns Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Handbook Number/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
