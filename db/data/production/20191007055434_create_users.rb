# frozen_string_literal: true

class CreateUsers < SeedMigration::Migration
  def up
    Company.all.each do |company|
      RailsMultitenant::GlobalContextRegistry[:company_id] = company.id

      user = User.create! email: Faker::Internet.free_email, password: '123456', password_confirmation: '123456'
      next if UserCompany.where(user: user, company: company).any?

      next unless user.user_companies.count <= 3

      user_company = UserCompany.create(user: user, company: company)

      (1..5).to_a.sample.times do
        role = Role.order('RANDOM()')&.first
        next if UserRole.where(user_company: user_company, role: role).any?

        UserRole.create! user_company: user_company, role: role
      end
    end
  end

  def down; end
end
