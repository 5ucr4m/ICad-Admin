# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'professional_teams/edit', type: :view do
  before(:each) do
    @professional_team = assign(:professional_team, ProfessionalTeam.create!(
                                                      name: 'MyString',
                                                      code: 'MyString',
                                                      active: false,
                                                      company: nil,
                                                      slug: 'MyString'
                                                    ))
  end

  it 'renders the edit professional_team form' do
    render

    assert_select 'form[action=?][method=?]', professional_team_path(@professional_team), 'post' do
      assert_select 'input[name=?]', 'professional_team[name]'

      assert_select 'input[name=?]', 'professional_team[code]'

      assert_select 'input[name=?]', 'professional_team[active]'

      assert_select 'input[name=?]', 'professional_team[company_id]'

      assert_select 'input[name=?]', 'professional_team[slug]'
    end
  end
end
