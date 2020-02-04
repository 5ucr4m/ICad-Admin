# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('family_members/edit', type: :view) do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      family: nil,
      social_name: 'MyString',
      city: nil,
      unknown_mother: false,
      mother_name: 'MyString',
      email: 'MyString',
      nationality: nil,
      name: 'MyString',
      cns_number: 'MyString',
      cns_responsible: 'MyString',
      phone: 'MyString',
      pis_pasep_number: 'MyString',
      birth_country: nil,
      race: nil,
      gender: nil,
      responsible: false,
      ethnicity: nil,
      unknown_father: false,
      father_name: 'MyString',
      naturalize_decree: 'MyString',
      micro_area: 'MyString',
      out_area: false,
      company: nil,
      slug: 'MyString'
    ))
  end

  it 'renders the edit family_member form' do
    render

    assert_select 'form[action=?][method=?]', family_member_path(@family_member), 'post' do
      assert_select 'input[name=?]', 'family_member[family_id]'

      assert_select 'input[name=?]', 'family_member[social_name]'

      assert_select 'input[name=?]', 'family_member[city_id]'

      assert_select 'input[name=?]', 'family_member[unknown_mother]'

      assert_select 'input[name=?]', 'family_member[mother_name]'

      assert_select 'input[name=?]', 'family_member[email]'

      assert_select 'input[name=?]', 'family_member[nationality_id]'

      assert_select 'input[name=?]', 'family_member[name]'

      assert_select 'input[name=?]', 'family_member[cns_number]'

      assert_select 'input[name=?]', 'family_member[cns_responsible]'

      assert_select 'input[name=?]', 'family_member[phone]'

      assert_select 'input[name=?]', 'family_member[pis_pasep_number]'

      assert_select 'input[name=?]', 'family_member[birth_country_id]'

      assert_select 'input[name=?]', 'family_member[race_id]'

      assert_select 'input[name=?]', 'family_member[gender_id]'

      assert_select 'input[name=?]', 'family_member[responsible]'

      assert_select 'input[name=?]', 'family_member[ethnicity_id]'

      assert_select 'input[name=?]', 'family_member[unknown_father]'

      assert_select 'input[name=?]', 'family_member[father_name]'

      assert_select 'input[name=?]', 'family_member[naturalize_decree]'

      assert_select 'input[name=?]', 'family_member[micro_area]'

      assert_select 'input[name=?]', 'family_member[out_area]'

      assert_select 'input[name=?]', 'family_member[company_id]'

      assert_select 'input[name=?]', 'family_member[slug]'
    end
  end
end
