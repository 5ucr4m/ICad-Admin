require 'rails_helper'

RSpec.describe "medicines/show", type: :view do
  before(:each) do
    @medicine = assign(:medicine, Medicine.create!(
      :name => "Name",
      :substance => "Substance",
      :laboratory => "Laboratory",
      :laboratory_registry => "Laboratory Registry",
      :ggrem_code => "Ggrem Code",
      :registry => "Registry",
      :ean_one => "Ean One",
      :ean_two => "Ean Two",
      :ean_three => "Ean Three",
      :presentation => "Presentation",
      :therapeutic_class => nil,
      :product_type => nil,
      :stripe => nil,
      :slug => "Slug",
      :company => nil,
      :ip => "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Substance/)
    expect(rendered).to match(/Laboratory/)
    expect(rendered).to match(/Laboratory Registry/)
    expect(rendered).to match(/Ggrem Code/)
    expect(rendered).to match(/Registry/)
    expect(rendered).to match(/Ean One/)
    expect(rendered).to match(/Ean Two/)
    expect(rendered).to match(/Ean Three/)
    expect(rendered).to match(/Presentation/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Ip/)
  end
end
