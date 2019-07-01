require "rails_helper"

RSpec.describe VaccinationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vaccinations").to route_to("vaccinations#index")
    end

    it "routes to #new" do
      expect(:get => "/vaccinations/new").to route_to("vaccinations#new")
    end

    it "routes to #show" do
      expect(:get => "/vaccinations/1").to route_to("vaccinations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vaccinations/1/edit").to route_to("vaccinations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vaccinations").to route_to("vaccinations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vaccinations/1").to route_to("vaccinations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vaccinations/1").to route_to("vaccinations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vaccinations/1").to route_to("vaccinations#destroy", :id => "1")
    end
  end
end
