# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'states/show', type: :view do
  before(:each) do
    @state = assign(:state, State.create!(
                              name: 'Name',
                              abbreviation: 'Abbreviation',
                              code: 'Code',
                              reference: 'Reference',
                              slug: 'Slug'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Abbreviation/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Slug/)
  end
end
