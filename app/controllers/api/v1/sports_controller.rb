# frozen_string_literal: true

module Api
  module V1
    class SportsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        sports = Sport.all

        render json: SportSerializer.new(sports, options).serialized_json
      end

      def show
        sport = Sport.find_by(slug: params[:slug])

        render json: SportSerializer.new(sport, options).serialized_json
      end

      def create
        sport = Sport.new(sports_params)

        if sport.save
          render json: SportSerializer.new(sport).serialized_json
        else
          render json: { error: sport.errors.messages }, status: 422
        end
      end

      private

      def sports_params
        params.require(:sport).permit(:name, :image_url)
      end

      def options
        @options ||= { include: %i[measurements] }
      end
    end
  end
end
