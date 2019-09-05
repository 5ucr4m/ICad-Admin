# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'periods/new', type: :view do
  before(:each) do
    assign(:period, Period.new(
                      company: nil,
                      slug: 'MyString'
                    ))
  end

  it 'renders new period form' do
    render

    assert_select 'form[action=?][method=?]', periods_path, 'post' do
      assert_select 'input[name=?]', 'period[company_id]'

      assert_select 'input[name=?]', 'period[slug]'
    end
  end
end
