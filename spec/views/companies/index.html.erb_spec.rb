# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'companies/index', type: :view do
  before(:each) do
    assign(:companies, [
             Company.create!(
               legal_full_name: 'Legal Full Name',
               fancy_name: 'Fancy Name',
               federal_registry: 'Federal Registry',
               state_registry: 'State Registry',
               patio: 'Patio',
               number: 'Number',
               zip: 'Zip',
               reference: 'Reference',
               district: 'District',
               city: nil,
               complement: 'Complement',
               slug: 'Slug'
             ),
             Company.create!(
               legal_full_name: 'Legal Full Name',
               fancy_name: 'Fancy Name',
               federal_registry: 'Federal Registry',
               state_registry: 'State Registry',
               patio: 'Patio',
               number: 'Number',
               zip: 'Zip',
               reference: 'Reference',
               district: 'District',
               city: nil,
               complement: 'Complement',
               slug: 'Slug'
             )
           ])
  end

  it 'renders a list of companies' do
    render
    assert_select 'tr>td', text: 'Legal Full Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Fancy Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Federal Registry'.to_s, count: 2
    assert_select 'tr>td', text: 'State Registry'.to_s, count: 2
    assert_select 'tr>td', text: 'Patio'.to_s, count: 2
    assert_select 'tr>td', text: 'Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Zip'.to_s, count: 2
    assert_select 'tr>td', text: 'Reference'.to_s, count: 2
    assert_select 'tr>td', text: 'District'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Complement'.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
