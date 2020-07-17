# frozen_string_literal: true

class AddDateToMeasurement < ActiveRecord::Migration[6.0]
  def change
    add_column :measurements, :date, :datetime
  end
end
