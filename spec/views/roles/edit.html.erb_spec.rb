# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'roles/edit', type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
                            name: 'MyString',
                            description: 'MyText',
                            role_type: 1,
                            admin: false,
                            slug: 'MyString'
                          ))
  end

  it 'renders the edit role form' do
    render

    assert_select 'form[action=?][method=?]', role_path(@role), 'post' do
      assert_select 'input[name=?]', 'role[name]'

      assert_select 'textarea[name=?]', 'role[description]'

      assert_select 'input[name=?]', 'role[role_type]'

      assert_select 'input[name=?]', 'role[admin]'

      assert_select 'input[name=?]', 'role[slug]'
    end
  end
end
