# frozen_string_literal: true

class Measurement < ApplicationRecord
  validates :time, presence: true
  belongs_to :sport
end
