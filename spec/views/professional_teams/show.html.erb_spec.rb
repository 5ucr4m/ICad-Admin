# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'professional_teams/show', type: :view do
  before(:each) do
    @professional_team = assign(:professional_team, ProfessionalTeam.create!(
                                                      name: 'Name',
                                                      code: 'Code',
                                                      active: false,
                                                      health_establishment: nil,
                                                      slug: 'Slug',
                                                      company: nil
                                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end
