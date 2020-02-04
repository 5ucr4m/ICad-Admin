# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('states/edit', type: :view) do
  before(:each) do
    @state = assign(:state, State.create!(
      name: 'MyString',
      abbreviation: 'MyString',
      code: 'MyString',
      reference: 'MyString',
      country: nil,
      slug: 'MyString'
    ))
  end

  it 'renders the edit state form' do
    render

    assert_select 'form[action=?][method=?]', state_path(@state), 'post' do
      assert_select 'input[name=?]', 'state[name]'

      assert_select 'input[name=?]', 'state[abbreviation]'

      assert_select 'input[name=?]', 'state[code]'

      assert_select 'input[name=?]', 'state[reference]'

      assert_select 'input[name=?]', 'state[country_id]'

      assert_select 'input[name=?]', 'state[slug]'
    end
  end
end
