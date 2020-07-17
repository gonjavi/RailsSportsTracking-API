# frozen_string_literal: true

require 'json'

module Api
  module V1
    class ProgressesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        today = Measurement.today
        yesterday = Measurement.yesterday
        lastweek = Measurement.lastweek

        progress = Progress.new({
                                  "id": 1,
                                  "today": today,
                                  "yesterday": yesterday,
                                  "lastweek": lastweek
                                })

        render json: TodaySerializer.new(progress).serialized_json
      end
    end
  end
end
