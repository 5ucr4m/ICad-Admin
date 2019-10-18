# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'health_professionals/show', type: :view do
  before(:each) do
    @health_professional = assign(:health_professional, HealthProfessional.create!(
                                                          cns_code: 'Cns Code',
                                                          cbo_code: nil,
                                                          full_name: 'Full Name',
                                                          federal_registry: 'Federal Registry',
                                                          state_registry: 'State Registry',
                                                          professional_team: nil,
                                                          company: nil,
                                                          slug: 'Slug'
                                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Cns Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Federal Registry/)
    expect(rendered).to match(/State Registry/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
