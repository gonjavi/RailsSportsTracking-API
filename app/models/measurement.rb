# frozen_string_literal: true

class Measurement < ApplicationRecord
  validates :time, presence: true
  belongs_to :sport

  scope :yesterday, -> { where('date >= ? and date < ?' , Date.current.yesterday, Date.today).count(:time) }
  scope :today, -> { where('date >= ? ', Date.today).count(:time) }
  scope :twodaysago, -> { where('date >= ? and date < ? ', Date.today - 2, Date.current.yesterday).count(:time) }
  scope :lastweek, -> { where('date >= ? and date <= ? ', Date.today - 8, Date.today + 1).count(:time) }
end
