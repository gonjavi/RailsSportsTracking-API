# frozen_string_literal: true

class MeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :sport_id
end
