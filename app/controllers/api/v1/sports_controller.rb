module Api
  module V1
    class SportsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        sports = Sport.all

        render json: SportSerializer.new(sports, options).serialized_json
      end

      private

      def options
        @options ||= { include: %i[measurements] }
      end
    end
  end
end
