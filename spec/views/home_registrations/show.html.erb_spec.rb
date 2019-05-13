require 'rails_helper'

RSpec.describe "home_registrations/show", type: :view do
  before(:each) do
    @home_registration = assign(:home_registration, HomeRegistration.create!(
      :health_professional => nil,
      :living_condition => nil,
      :address => nil,
      :registry_updated => false,
      :pet_quantity => 2,
      :refuse_registration => false,
      :tp_cds_origin => 3,
      :uuid => "Uuid",
      :uuid_origin => "Uuid Origin",
      :home_type => nil,
      :permanence_institution => nil,
      :finished => false,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Uuid/)
    expect(rendered).to match(/Uuid Origin/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
