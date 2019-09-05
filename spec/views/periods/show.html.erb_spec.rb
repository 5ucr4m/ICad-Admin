# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'periods/show', type: :view do
  before(:each) do
    @period = assign(:period, Period.create!(
                                company: nil,
                                slug: 'Slug'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
  end
end
