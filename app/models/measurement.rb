# frozen_string_literal: true

class Measurement < ApplicationRecord
  validates :time, presence: true
  validates :date, presence: true
  belongs_to :sport

  scope :yesterday, -> { where('date = ?', Date.yesterday).sum(:time) }
  scope :today, -> { where('date >= ? ', Date.today).sum(:time) }
  scope :lastweek, -> { where('date >= ? and date <= ? ', Date.today - 8, Date.today).sum(:time) }
end
