# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/edit', type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
                            name: 'MyString',
                            abbreviation: 'MyString',
                            code: 'MyString',
                            state: nil,
                            reference: 'MyString',
                            slug: 'MyString'
                          ))
  end

  it 'renders the edit city form' do
    render

    assert_select 'form[action=?][method=?]', city_path(@city), 'post' do
      assert_select 'input[name=?]', 'city[name]'

      assert_select 'input[name=?]', 'city[abbreviation]'

      assert_select 'input[name=?]', 'city[code]'

      assert_select 'input[name=?]', 'city[state_id]'

      assert_select 'input[name=?]', 'city[reference]'

      assert_select 'input[name=?]', 'city[slug]'
    end
  end
end
