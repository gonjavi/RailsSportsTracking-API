class CreateProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :progresses do |t|
      t.string :today
      t.string :yesterday
      t.string :lastweek

      t.timestamps
    end
  end
end
