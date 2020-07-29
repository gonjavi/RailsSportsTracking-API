module Api
  module V1
    class MeasurementsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :set_measurement, only: %i[destroy]

      def index
        measurement = Measurement.all

        render json: MeasurementSerializer.new(measurement).serialized_json
      end

      def create
        measurement = Measurement.new(measurement_params)

        if measurement.save
          render json: MeasurementSerializer.new(measurement).serialized_json
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      def destroy
        head :no_content if @measurement.destroy
      end

      private

      def set_measurement
        @measurement = Measurement.find(params[:id])
      end

      def measurement_params
        params.require(:measurement).permit(:time, :date, :sport_id)
      end
    end
  end
end
