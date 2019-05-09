require 'rails_helper'

RSpec.describe "health_professionals/show", type: :view do
  before(:each) do
    @health_professional = assign(:health_professional, HealthProfessional.create!(
      :cns_code => "Cns Code",
      :registry => nil,
      :health_establishment => nil,
      :professional_team => nil,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cns Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
