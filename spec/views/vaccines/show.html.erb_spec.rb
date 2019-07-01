require 'rails_helper'

RSpec.describe "vaccines/show", type: :view do
  before(:each) do
    @vaccine = assign(:vaccine, Vaccine.create!(
      :description => "Description",
      :immunobiological => nil,
      :vaccination_strategy => nil,
      :dose => nil,
      :lot_number => "Lot Number",
      :manufacturer => "Manufacturer",
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Lot Number/)
    expect(rendered).to match(/Manufacturer/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
