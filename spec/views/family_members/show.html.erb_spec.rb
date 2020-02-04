# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('family_members/show', type: :view) do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      family: nil,
      social_name: 'Social Name',
      city: nil,
      unknown_mother: false,
      mother_name: 'Mother Name',
      email: 'Email',
      nationality: nil,
      name: 'Name',
      cns_number: 'Cns Number',
      cns_responsible: 'Cns Responsible',
      phone: 'Phone',
      pis_pasep_number: 'Pis Pasep Number',
      birth_country: nil,
      race: nil,
      gender: nil,
      responsible: false,
      ethnicity: nil,
      unknown_father: false,
      father_name: 'Father Name',
      naturalize_decree: 'Naturalize Decree',
      micro_area: 'Micro Area',
      out_area: false,
      company: nil,
      slug: 'Slug'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Social Name/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/Mother Name/))
    expect(rendered).to(match(/Email/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/Cns Number/))
    expect(rendered).to(match(/Cns Responsible/))
    expect(rendered).to(match(/Phone/))
    expect(rendered).to(match(/Pis Pasep Number/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(/Father Name/))
    expect(rendered).to(match(/Naturalize Decree/))
    expect(rendered).to(match(/Micro Area/))
    expect(rendered).to(match(/false/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/Slug/))
  end
end
