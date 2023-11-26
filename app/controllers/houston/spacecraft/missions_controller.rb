module Houston
  module Spacecraft
    class MissionsController < ApplicationController
      before_action :find_spacecraft!
      def index
        missions = Houston::Client::Spacecraft.missions(params[:spacecraft_id])

        render json: missions
      end

      private

      def find_spacecraft!
        # TODO: Add find_spacecraft to validate that the spacecraft exists
        # Houston::Client::Spacecraft.find(params[:spacecraft_id]) || raise(ActiveRecord::RecordNotFound)
      end
    end
  end
end
