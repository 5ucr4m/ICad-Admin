# frozen_string_literal: true

class CreateStates < SeedMigration::Migration
  def up
    State.create!(name: 'ACRE', reference: 1)
    State.create!(name: 'ALAGOAS', reference: 2)
    State.create!(name: 'AMAPÁ', reference: 3)
    State.create!(name: 'AMAZONAS', reference: 4)
    State.create!(name: 'BAHIA', reference: 5)
    State.create!(name: 'CEARÁ', reference: 6)
    State.create!(name: 'DISTRITO FEDERAL', reference: 7)
    State.create!(name: 'ESPÍRITO SANTO', reference: 8)
    State.create!(name: 'GOIÁS', reference: 10)
    State.create!(name: 'MARANHÃO', reference: 11)
    State.create!(name: 'MATO GROSSO', reference: 12)
    State.create!(name: 'MATO GROSSO DO SUL', reference: 13)
    State.create!(name: 'MINAS GERAIS', reference: 14)
    State.create!(name: 'PARÁ', reference: 15)
    State.create!(name: 'PARAÍBA', reference: 16)
    State.create!(name: 'PARANÁ', reference: 17)
    State.create!(name: 'PERNAMBUCO', reference: 18)
    State.create!(name: 'PIAUÍ', reference: 19)
    State.create!(name: 'RIO DE JANEIRO', reference: 20)
    State.create!(name: 'RIO GRANDE DO NORTE', reference: 21)
    State.create!(name: 'RIO GRANDE DO SUL', reference: 22)
    State.create!(name: 'RONDÔNIA', reference: 23)
    State.create!(name: 'RORAIMA', reference: 9)
    State.create!(name: 'SANTA CATARINA', reference: 25)
    State.create!(name: 'SÃO PAULO', reference: 26)
    State.create!(name: 'SERGIPE', reference: 27)
    State.create!(name: 'TOCANTINS', reference: 24)

    country = GenericModel.find_by(generic_field: :country, reference: 31)
    http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
    states = JSON.parse http.get('/celsodantas/br_populate/master/states.json').body

    states.each do |state|
      state_obj = State.find_by(name: state['name'].mb_chars.upcase)

      next unless state_obj

      state_obj.update(abbreviation: state['acronym'], country: country, code: state['code'])
    end
  end

  def down; end
end
