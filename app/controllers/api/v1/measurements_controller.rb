module Api
  module V1
    class MeasurementsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        measurement = Measurement.all

        render json: MeasurementSerializer.new(measurement).serialized_json
      end

      def show
        measurement = Measurement.find(params[:id])

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

      def update
        measurement = Measurement.find(params[:id])

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
        params.require(:measurement).permit(:id, :time, :date, :sport_id)
      end
    end
  end
end
