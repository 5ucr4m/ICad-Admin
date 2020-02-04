# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('periods/index', type: :view) do
  before(:each) do
    assign(:periods, [
      Period.create!(
        company: nil,
        slug: 'Slug'
      ),
      Period.create!(
        company: nil,
        slug: 'Slug'
      ),
    ])
  end

  it 'renders a list of periods' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
