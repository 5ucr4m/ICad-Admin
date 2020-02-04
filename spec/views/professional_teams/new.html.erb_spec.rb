# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('professional_teams/new', type: :view) do
  before(:each) do
    assign(:professional_team, ProfessionalTeam.new(
      name: 'MyString',
      code: 'MyString',
      active: false,
      health_establishment: nil,
      slug: 'MyString',
      company: nil
    ))
  end

  it 'renders new professional_team form' do
    render

    assert_select 'form[action=?][method=?]', professional_teams_path, 'post' do
      assert_select 'input[name=?]', 'professional_team[name]'

      assert_select 'input[name=?]', 'professional_team[code]'

      assert_select 'input[name=?]', 'professional_team[active]'

      assert_select 'input[name=?]', 'professional_team[health_establishment_id]'

      assert_select 'input[name=?]', 'professional_team[slug]'

      assert_select 'input[name=?]', 'professional_team[company_id]'
    end
  end
end
