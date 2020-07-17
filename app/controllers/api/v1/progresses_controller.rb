# frozen_string_literal: true

module Api
  module V1
    class ProgressesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        today = Measurement.today
        yesterday = Measurement.yesterday
        lastweek = Measurement.lastweek
        twodaysago = Measurement.twodaysago

        progress = Progress.new({
                                  "id": 1,
                                  "today": today,
                                  "yesterday": yesterday,
                                  "lastweek": lastweek,
                                  "twodaysago": twodaysago,
                                })

        render json: TodaySerializer.new(progress).serialized_json
      end
    end
  end
end
