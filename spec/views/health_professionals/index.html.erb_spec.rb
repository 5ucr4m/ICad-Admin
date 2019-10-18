# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'health_professionals/index', type: :view do
  before(:each) do
    assign(:health_professionals, [
             HealthProfessional.create!(
               cns_code: 'Cns Code',
               cbo_code: nil,
               full_name: 'Full Name',
               federal_registry: 'Federal Registry',
               state_registry: 'State Registry',
               professional_team: nil,
               company: nil,
               slug: 'Slug'
             ),
             HealthProfessional.create!(
               cns_code: 'Cns Code',
               cbo_code: nil,
               full_name: 'Full Name',
               federal_registry: 'Federal Registry',
               state_registry: 'State Registry',
               professional_team: nil,
               company: nil,
               slug: 'Slug'
             )
           ])
  end

  it 'renders a list of health_professionals' do
    render
    assert_select 'tr>td', text: 'Cns Code'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Full Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Federal Registry'.to_s, count: 2
    assert_select 'tr>td', text: 'State Registry'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
