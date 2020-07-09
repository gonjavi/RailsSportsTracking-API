# frozen_string_literal: true

class MeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :date, :sport_id
end
