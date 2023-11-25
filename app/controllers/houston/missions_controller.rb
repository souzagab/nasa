module Houston
  class MissionsController < ApplicationController
    def index
      missions = Houston::Client::Mission.all

      render json: missions
    end
  end
end
