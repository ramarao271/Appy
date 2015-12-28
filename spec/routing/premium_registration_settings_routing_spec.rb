require "rails_helper"

RSpec.describe PremiumRegistrationSettingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/premium_registration_settings").to route_to("premium_registration_settings#index")
    end

    it "routes to #new" do
      expect(:get => "/premium_registration_settings/new").to route_to("premium_registration_settings#new")
    end

    it "routes to #show" do
      expect(:get => "/premium_registration_settings/1").to route_to("premium_registration_settings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/premium_registration_settings/1/edit").to route_to("premium_registration_settings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/premium_registration_settings").to route_to("premium_registration_settings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/premium_registration_settings/1").to route_to("premium_registration_settings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/premium_registration_settings/1").to route_to("premium_registration_settings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/premium_registration_settings/1").to route_to("premium_registration_settings#destroy", :id => "1")
    end

  end
end
