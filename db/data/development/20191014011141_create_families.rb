class CreateFamilies < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    HomeRegistration.all.each do |hr|
      family = Family.create!(
        home_registration: hr,
        responsible_birth_date: Faker::Date.backward,
        responsible_cns_number: Faker::IDNumber.brazilian_rg,
        members_quantity: (1..20).to_a.sample,
        handbook_number: Faker::IDNumber.valid,
        family_income: GenericModel.family_incomes.order('RANDOM()').first,
        reside_since: Faker::Date.backward,
        moving: [0, 1].sample,
        company: company
      )
      family.members_quantity.times do
        um = [0, 1].sample
        uf = [0, 1].sample
        FamilyMember.create!(
          family: family,
          social_name: Faker::Name.name_with_middle,
          city: City.find_by(name: 'TERESINA'),
          birth_date: Faker::Date.backward,
          unknown_mother: um,
          mother_name: (Faker::Name.feminine_name unless um),
          email: Faker::Internet.email,
          birth_country: GenericModel.countries.where(name: 'BRASIL').first,
          nationality: GenericModel.nationalities.where(reference: 1).first,
          name: Faker::Name.name_with_middle,
          cns_number: Faker::IDNumber.brazilian_rg,
          cns_responsible: Faker::IDNumber.brazilian_rg,
          phone: Faker::PhoneNumber.cell_phone,
          pis_pasep_number: Faker::IDNumber.valid,
          race: GenericModel.races.order('RANDOM()').first,
          gender: GenericModel.genders.order('RANDOM()').first,
          responsible: [0, 1].sample,
          ethnicity: GenericModel.ethnicities.order('RANDOM()').first,
          unknown_father: uf,
          father_name: (Faker::Name.masculine_name unless uf),
          company: hr.company
        )
      end
    end
  end

  def down

  end
end
