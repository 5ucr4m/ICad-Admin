# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('cities/index', type: :view) do
  before(:each) do
    assign(:cities, [
      City.create!(
        name: 'Name',
        abbreviation: 'Abbreviation',
        code: 'Code',
        state: nil,
        reference: 'Reference',
        slug: 'Slug'
      ),
      City.create!(
        name: 'Name',
        abbreviation: 'Abbreviation',
        code: 'Code',
        state: nil,
        reference: 'Reference',
        slug: 'Slug'
      ),
    ])
  end

  it 'renders a list of cities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Abbreviation'.to_s, count: 2
    assert_select 'tr>td', text: 'Code'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Reference'.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
