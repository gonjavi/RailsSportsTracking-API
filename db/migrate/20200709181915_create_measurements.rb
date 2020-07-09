# frozen_string_literal: true

class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.time :time
      t.belongs_to :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
