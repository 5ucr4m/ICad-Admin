# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('health_establishments/show', type: :view) do
  before(:each) do
    @health_establishment = assign(:health_establishment, HealthEstablishment.create!(
      cnes_code: 'Cnes Code',
      unit_code: 'Unit Code',
      legal_full_name: 'Legal Full Name',
      fancy_name: 'Fancy Name',
      federal_registry: 'Federal Registry',
      state_registry: 'State Registry',
      manager_full_name: 'Manager Full Name',
      manager_federal_registry: 'Manager Federal Registry',
      unit_type: nil,
      company: nil,
      slug: 'Slug'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Cnes Code/))
    expect(rendered).to(match(/Unit Code/))
    expect(rendered).to(match(/Legal Full Name/))
    expect(rendered).to(match(/Fancy Name/))
    expect(rendered).to(match(/Federal Registry/))
    expect(rendered).to(match(/State Registry/))
    expect(rendered).to(match(/Manager Full Name/))
    expect(rendered).to(match(/Manager Federal Registry/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
  end
end
