require 'rails_helper'

RSpec.describe "PremiumRegistrationSettings", type: :request do
  describe "GET /premium_registration_settings" do
    it "works! (now write some real specs)" do
      get premium_registration_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
