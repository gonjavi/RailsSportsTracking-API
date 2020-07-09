# frozen_string_literal: true

module Api
  module V1
    class MeasurementsController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        measurement = Measurement.new(measurement_params)

        if measurement.save
          render json: MeasurementSerializer.new(measurement).serialized_json
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      def destroy
        measurement = Measurement.find(params[:id])

        if measurement.destroy
          head :no_content
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      private

      def measurement_params
        params.require(:measurement).permit(:time, :date, :sport_id)
      end
    end
  end
end
