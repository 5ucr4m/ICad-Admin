# frozen_string_literal: true

class CreateStates < SeedMigration::Migration
  def up
    State.create!(name: 'ACRE', reference: 1, abbreviation: 'AC', code: 1)
    State.create!(name: 'ALAGOAS', reference: 2, abbreviation: 'AL', code: 2)
    State.create!(name: 'AMAPÁ', reference: 3, abbreviation: 'AP', code: 3)
    State.create!(name: 'AMAZONAS', reference: 4, abbreviation: 'AM', code: 4)
    State.create!(name: 'BAHIA', reference: 5, abbreviation: 'BA', code: 5)
    State.create!(name: 'CEARÁ', reference: 6, abbreviation: 'CE', code: 6)
    State.create!(name: 'DISTRITO FEDERAL', reference: 7, abbreviation: 'DF', code: 7)
    State.create!(name: 'ESPÍRITO SANTO', reference: 8, abbreviation: 'ES', code: 8)
    State.create!(name: 'GOIÁS', reference: 10, abbreviation: 'GO', code: 10)
    State.create!(name: 'MARANHÃO', reference: 11, abbreviation: 'MA', code: 11)
    State.create!(name: 'MATO GROSSO', reference: 12, abbreviation: 'MT', code: 12)
    State.create!(name: 'MATO GROSSO DO SUL', reference: 13, abbreviation: 'MS', code: 13)
    State.create!(name: 'MINAS GERAIS', reference: 14, abbreviation: 'MG', code: 14)
    State.create!(name: 'PARÁ', reference: 15, abbreviation: 'PA', code: 15)
    State.create!(name: 'PARAÍBA', reference: 16, abbreviation: 'PB', code: 16)
    State.create!(name: 'PARANÁ', reference: 17, abbreviation: 'PR', code: 17)
    State.create!(name: 'PERNAMBUCO', reference: 18, abbreviation: 'PB', code: 18)
    State.create!(name: 'PIAUÍ', reference: 19, abbreviation: 'PI', code: 19)
    State.create!(name: 'RIO DE JANEIRO', reference: 20, abbreviation: 'RJ', code: 20)
    State.create!(name: 'RIO GRANDE DO NORTE', reference: 21, abbreviation: 'RN', code: 21)
    State.create!(name: 'RIO GRANDE DO SUL', reference: 22, abbreviation: 'RS', code: 22)
    State.create!(name: 'RONDÔNIA', reference: 23, abbreviation: 'RO', code: 23)
    State.create!(name: 'RORAIMA', reference: 9, abbreviation: 'RR', code: 9)
    State.create!(name: 'SANTA CATARINA', reference: 25, abbreviation: 'SC', code: 25)
    State.create!(name: 'SÃO PAULO', reference: 26, abbreviation: 'SP', code: 26)
    State.create!(name: 'SERGIPE', reference: 27, abbreviation: 'SE', code: 27)
    State.create!(name: 'TOCANTINS', reference: 24, abbreviation: 'TO', code: 24)

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
