require "rails_helper"

RSpec.describe ProfessionalTeamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/professional_teams").to route_to("professional_teams#index")
    end

    it "routes to #new" do
      expect(:get => "/professional_teams/new").to route_to("professional_teams#new")
    end

    it "routes to #show" do
      expect(:get => "/professional_teams/1").to route_to("professional_teams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/professional_teams/1/edit").to route_to("professional_teams#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/professional_teams").to route_to("professional_teams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professional_teams/1").to route_to("professional_teams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professional_teams/1").to route_to("professional_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professional_teams/1").to route_to("professional_teams#destroy", :id => "1")
    end
  end
end
