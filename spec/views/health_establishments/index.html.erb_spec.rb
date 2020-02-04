# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('health_establishments/index', type: :view) do
  before(:each) do
    assign(:health_establishments, [
      HealthEstablishment.create!(
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
      ),
      HealthEstablishment.create!(
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
      ),
    ])
  end

  it 'renders a list of health_establishments' do
    render
    assert_select 'tr>td', text: 'Cnes Code'.to_s, count: 2
    assert_select 'tr>td', text: 'Unit Code'.to_s, count: 2
    assert_select 'tr>td', text: 'Legal Full Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Fancy Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Federal Registry'.to_s, count: 2
    assert_select 'tr>td', text: 'State Registry'.to_s, count: 2
    assert_select 'tr>td', text: 'Manager Full Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Manager Federal Registry'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
