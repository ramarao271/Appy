require 'rails_helper'

RSpec.describe "LineItemProperties", type: :request do
  describe "GET /line_item_properties" do
    it "works! (now write some real specs)" do
      get line_item_properties_path
      expect(response).to have_http_status(200)
    end
  end
end
