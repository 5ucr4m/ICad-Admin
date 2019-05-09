require 'rails_helper'

RSpec.describe "ProfessionalTeams", type: :request do
  describe "GET /professional_teams" do
    it "works! (now write some real specs)" do
      get professional_teams_path
      expect(response).to have_http_status(200)
    end
  end
end
