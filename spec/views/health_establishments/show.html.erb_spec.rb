require 'rails_helper'

RSpec.describe "health_establishments/show", type: :view do
  before(:each) do
    @health_establishment = assign(:health_establishment, HealthEstablishment.create!(
      :cnes_code => "Cnes Code",
      :unit_code => "Unit Code",
      :registry => nil,
      :manager => nil,
      :unit_type => nil,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cnes Code/)
    expect(rendered).to match(/Unit Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
