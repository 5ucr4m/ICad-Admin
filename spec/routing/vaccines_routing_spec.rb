require "rails_helper"

RSpec.describe VaccinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vaccines").to route_to("vaccines#index")
    end

    it "routes to #new" do
      expect(:get => "/vaccines/new").to route_to("vaccines#new")
    end

    it "routes to #show" do
      expect(:get => "/vaccines/1").to route_to("vaccines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vaccines/1/edit").to route_to("vaccines#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vaccines").to route_to("vaccines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vaccines/1").to route_to("vaccines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vaccines/1").to route_to("vaccines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vaccines/1").to route_to("vaccines#destroy", :id => "1")
    end
  end
end
