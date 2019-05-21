# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'companies/show', type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
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
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Legal Full Name/)
    expect(rendered).to match(/Fancy Name/)
    expect(rendered).to match(/Federal Registry/)
    expect(rendered).to match(/State Registry/)
    expect(rendered).to match(/Patio/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Complement/)
    expect(rendered).to match(/Slug/)
  end
end
