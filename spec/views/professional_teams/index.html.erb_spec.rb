# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'professional_teams/index', type: :view do
  before(:each) do
    assign(:professional_teams, [
             ProfessionalTeam.create!(
               name: 'Name',
               code: 'Code',
               active: false,
               company: nil,
               slug: 'Slug'
             ),
             ProfessionalTeam.create!(
               name: 'Name',
               code: 'Code',
               active: false,
               company: nil,
               slug: 'Slug'
             )
           ])
  end

  it 'renders a list of professional_teams' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Code'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Slug'.to_s, count: 2
  end
end
