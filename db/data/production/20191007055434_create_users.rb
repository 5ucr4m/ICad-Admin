# frozen_string_literal: true

class CreateUsers < SeedMigration::Migration
  def up
    company = Company.first
    RailsMultitenant::GlobalContextRegistry[:company_id] = company.id
    (10..30).to_a.sample.times do
      user = User.create! email: Faker::Internet.free_email,
                          password: '123456', password_confirmation: '123456'

      user_company = UserCompany.create(user: user, company: company, current: true)
      role = Role.order('RANDOM()')&.first
      UserRole.create! user_company: user_company, role: role
    end
  end

  def down; end
end
