require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      :registry => nil,
      :gender => nil,
      :race => nil,
      :birth_state => nil,
      :nationality => nil,
      :birth_country => nil,
      :mother_name => "Mother Name",
      :sus_card_number => "Sus Card Number",
      :pis_pasep_number => "Pis Pasep Number",
      :unknown_mother_name => false,
      :responsible_person => nil,
      :health_condition => nil,
      :company => nil,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Mother Name/)
    expect(rendered).to match(/Sus Card Number/)
    expect(rendered).to match(/Pis Pasep Number/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
