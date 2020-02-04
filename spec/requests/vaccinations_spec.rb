# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Vaccinations', type: :request) do
  describe 'GET /vaccinations' do
    it 'works! (now write some real specs)' do
      get vaccinations_path
      expect(response).to(have_http_status(200))
    end
  end
end
