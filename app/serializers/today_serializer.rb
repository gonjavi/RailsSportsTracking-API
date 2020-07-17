# frozen_string_literal: true

class TodaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :today, :yesterday, :twodaysago, :lastweek
end