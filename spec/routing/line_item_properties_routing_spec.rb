require "rails_helper"

RSpec.describe LineItemPropertiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/line_item_properties").to route_to("line_item_properties#index")
    end

    it "routes to #new" do
      expect(:get => "/line_item_properties/new").to route_to("line_item_properties#new")
    end

    it "routes to #show" do
      expect(:get => "/line_item_properties/1").to route_to("line_item_properties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/line_item_properties/1/edit").to route_to("line_item_properties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/line_item_properties").to route_to("line_item_properties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/line_item_properties/1").to route_to("line_item_properties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/line_item_properties/1").to route_to("line_item_properties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/line_item_properties/1").to route_to("line_item_properties#destroy", :id => "1")
    end

  end
end
