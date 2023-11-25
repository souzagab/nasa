module Houston
  class MissionsController < ApplicationController
    def index
      missions = Houston::Client::Mission.all

      render json: missions
    end

    def create
      mission = Houston::Client::Mission.create(mission_params)

      render json: mission, status: :created
    end

    private

    def mission_params
      params.permit(:planet_id, :spacecraft_id, :name, :description, :start_date, :duration)
    end
  end
end
