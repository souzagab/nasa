require "rails_helper"

RSpec.describe "houston/spacecraft/missions" do
  describe "GET /index" do
    let(:spacecraft_id) { Faker::Number.number(digits: 1) }

    before do
      stub_request(:get, "http://localhost:3000/spacecrafts/#{spacecraft_id}/missions")
      .with(
        headers: {
          "Accept" => "application/json",
              "Connection" => "close",
              "Host" => "localhost:3000",
              "User-Agent" => "Houston::Client/0.1.0"
        }
      )
      .to_return(status: 200, body: [].to_json, headers: {})
    end

    it "returns a list of missions scoped by spacecraft" do
      get "/spacecrafts/#{spacecraft_id}/missions"
      expect(response).to have_http_status(:success)

      expect(response.body).to eq("[]")
    end
  end
end
