# frozen_string_literal: true

class CreateVaccinations < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    FamilyMember.all.each do |fm|
      next unless Faker::Boolean.boolean

      vaccination = Vaccination.create!(
        uuid: "#{HealthProfessional.order('RANDOM()').first.cns_code}-#{SecureRandom.uuid}",
        vaccination_campaign: VaccinationCampaign.order('RANDOM()').first,
        company: company
      )
      pregnant = [0, 1].sample
      VaccinationItem.create!(
        vaccination: vaccination,
        turn_id: GenericModel.turns.order('RANDOM()').first,
        family_member: fm,
        local_service: GenericModel.local_services.order('RANDOM()').first,
        traveller: [0, 1].sample,
        leprosy_communicant: [0, 1].sample,
        pregnant: [0, 1].sample,
        puerperal: !pregnant,
        initial_date_hour: Time.zone.now,
        final_date_hour: Time.zone.now + (2..15).to_a.sample.minutes,
        company: vaccination.company
      )
      VaccinationVaccine.create!(vaccination: vaccination,
                                 vaccine: Vaccine.order('RANDOM()').first,
                                 company: vaccination.company)
    end
  end

  def down; end
end
