# frozen_string_literal: true

class CreateHomeVisitReasonTypes < SeedMigration::Migration
  def up
    GenericModel.create!(name: 'Cadastramento / Atualização'.mb_chars.upcase, reference: 1, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Visita periódica'.mb_chars.upcase, reference: 29, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Consulta'.mb_chars.upcase, reference: 2, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Exame'.mb_chars.upcase, reference: 3, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Vacina'.mb_chars.upcase, reference: 4, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Condicionalidades do bolsa família'.mb_chars.upcase, reference: 30, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Gestante'.mb_chars.upcase, reference: 5, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Puérpera'.mb_chars.upcase, reference: 6, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Recém-nascido'.mb_chars.upcase, reference: 7, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Criança'.mb_chars.upcase, reference: 8, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com desnutrição'.mb_chars.upcase, reference: 9, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa em reabilitação ou com deficiência'.mb_chars.upcase, reference: 10, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com hipertensão'.mb_chars.upcase, reference: 11, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com diabetes'.mb_chars.upcase, reference: 12, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com asma'.mb_chars.upcase, reference: 13, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com DPOC / enfisema'.mb_chars.upcase, reference: 14, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com câncer'.mb_chars.upcase, reference: 15, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com outras doenças crônicas'.mb_chars.upcase, reference: 16, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com hanseníase'.mb_chars.upcase, reference: 17, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Pessoa com tuberculose'.mb_chars.upcase, reference: 18, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Sintomáticos respiratórios'.mb_chars.upcase, reference: 32, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Tabagista'.mb_chars.upcase, reference: 33, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Domiciliados / Acamados'.mb_chars.upcase, reference: 19, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Condições de vulnerabilidade social'.mb_chars.upcase, reference: 20, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Condicionalidades do bolsa família'.mb_chars.upcase, reference: 21, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Saúde mental'.mb_chars.upcase, reference: 22, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Usuário de álcool'.mb_chars.upcase, reference: 23, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Usuário de outras drogas'.mb_chars.upcase, reference: 24, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Ação educativa'.mb_chars.upcase, reference: 34, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Imóvel com foco'.mb_chars.upcase, reference: 35, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Ação mecânica'.mb_chars.upcase, reference: 36, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Tratamento focal'.mb_chars.upcase, reference: 37, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Egresso de internação'.mb_chars.upcase, reference: 25, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Convite para atividades coletivas / campanha de saúde'.mb_chars.upcase, reference: 27, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Orientação / Prevenção'.mb_chars.upcase, reference: 31, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
    GenericModel.create!(name: 'Outros'.mb_chars.upcase, reference: 28, generic_field: :reason, generic_class: HomeVisitReason.model_name.name)
  end

  def down; end
end
