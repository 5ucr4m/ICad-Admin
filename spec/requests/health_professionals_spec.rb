require 'rails_helper'

RSpec.describe "HealthProfessionals", type: :request do
  describe "GET /health_professionals" do
    it "works! (now write some real specs)" do
      get health_professionals_path
      expect(response).to have_http_status(200)
    end
  end
end
