require 'rails_helper'

RSpec.describe "GenericModels", type: :request do
  describe "GET /generic_models" do
    it "works! (now write some real specs)" do
      get generic_models_path
      expect(response).to have_http_status(200)
    end
  end
end
