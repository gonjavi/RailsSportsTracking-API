module Api
  module V1
    class MeasurementsController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :set_measurement, only: %i(show update destroy)

      def index
        measurement = Measurement.all

        render json: MeasurementSerializer.new(measurement).serialized_json
      end

      def show
        render json: MeasurementSerializer.new(@measurement).serialized_json
      end

      def create
        measurement = Measurement.new(measurement_params)

        if measurement.save
          render json: MeasurementSerializer.new(measurement).serialized_json
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      def update  
        if @measurement.save
          render json: MeasurementSerializer.new(@measurement).serialized_json
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      def destroy
        if @measurement.destroy
          head :no_content
        else
          render json: { error: measurement.errors.messages }, status: 422
        end
      end

      private

      def set_measurement
        @measurement = Measurement.find(params[:id])
      end

      def measurement_params
        params.require(:measurement).permit(:id, :time, :date, :sport_id)
      end
    end
  end
end
