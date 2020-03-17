require "rails_helper"

RSpec.describe MedicalCaresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/medical_cares").to route_to("medical_cares#index")
    end

    it "routes to #new" do
      expect(:get => "/medical_cares/new").to route_to("medical_cares#new")
    end

    it "routes to #show" do
      expect(:get => "/medical_cares/1").to route_to("medical_cares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/medical_cares/1/edit").to route_to("medical_cares#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/medical_cares").to route_to("medical_cares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/medical_cares/1").to route_to("medical_cares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/medical_cares/1").to route_to("medical_cares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/medical_cares/1").to route_to("medical_cares#destroy", :id => "1")
    end
  end
end
