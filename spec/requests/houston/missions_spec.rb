require "rails_helper"

RSpec.describe "houston/missions" do
  describe "GET /missions" do
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

  describe "POST /missions" do
    let(:mission_params) do
      {
        planet_id: "1",
        spacecraft_id: "1",
        name: "Mission 1",
        description: "Mission 1 description",
        start_date: 1.day.since.to_s,
        duration: "5"
      }
    end

    let(:mission) { mission_params.merge(id: 1) }

    before do
      stub_request(:post, "http://localhost:3000/missions")
      .with(
        body: mission_params.to_json,
        headers: {
          "Accept" => "application/json",
              "Connection" => "close",
              "Content-Type" => "application/json; charset=UTF-8",
              "Host" => "localhost:3000",
              "User-Agent" => "Houston::Client/0.1.0"
        }
      )
      .to_return(status: 201, body: mission.to_json, headers: {})
    end

    it "creates a mission" do
      post "/missions", params: mission_params

      expect(response).to have_http_status(:created)
    end
  end
end
