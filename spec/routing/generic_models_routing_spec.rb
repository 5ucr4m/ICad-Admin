require "rails_helper"

RSpec.describe GenericModelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/generic_models").to route_to("generic_models#index")
    end

    it "routes to #new" do
      expect(:get => "/generic_models/new").to route_to("generic_models#new")
    end

    it "routes to #show" do
      expect(:get => "/generic_models/1").to route_to("generic_models#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/generic_models/1/edit").to route_to("generic_models#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/generic_models").to route_to("generic_models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/generic_models/1").to route_to("generic_models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/generic_models/1").to route_to("generic_models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/generic_models/1").to route_to("generic_models#destroy", :id => "1")
    end
  end
end
