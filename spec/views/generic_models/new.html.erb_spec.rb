# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'generic_models/new', type: :view do
  before(:each) do
    assign(:generic_model, GenericModel.new(
                             name: 'MyString',
                             description: 'MyString',
                             reference: 'MyString',
                             generic_field: 'MyString',
                             generic_class: 'MyString',
                             generic_model: nil,
                             slug: 'MyString'
                           ))
  end

  it 'renders new generic_model form' do
    render

    assert_select 'form[action=?][method=?]', generic_models_path, 'post' do
      assert_select 'input[name=?]', 'generic_model[name]'

      assert_select 'input[name=?]', 'generic_model[description]'

      assert_select 'input[name=?]', 'generic_model[reference]'

      assert_select 'input[name=?]', 'generic_model[generic_field]'

      assert_select 'input[name=?]', 'generic_model[generic_class]'

      assert_select 'input[name=?]', 'generic_model[generic_model_id]'

      assert_select 'input[name=?]', 'generic_model[slug]'
    end
  end
end
