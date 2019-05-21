# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/show', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
                            name: 'Name',
                            abbreviation: 'Abbreviation',
                            code: 'Code',
                            state: nil,
                            reference: 'Reference',
                            slug: 'Slug'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Abbreviation/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Slug/)
  end
end
