require "rails_helper"

RSpec.describe "houston/missions" do
  describe "GET /houston/missions" do
    before do
      stub_request(:get, "http://localhost:3000/missions")
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

    it "returns all missions" do
      get "/missions"

      expect(response).to have_http_status(:success)
    end
  end
end
