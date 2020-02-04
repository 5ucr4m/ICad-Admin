# frozen_string_literal: true

class CreateCities < SeedMigration::Migration
  def up
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    states = JSON.parse(http.get('/celsodantas/br_populate/master/states.json').body)

    states.each do |state|
      state_obj = State.find_by(reference: state['code'])

      state['cities'].each do |city|
        City.create(name: city['name'].mb_chars.upcase,
                    state: state_obj, code: city['code'], reference: city['code'])
      end
    end
  end

  def down; end
end
