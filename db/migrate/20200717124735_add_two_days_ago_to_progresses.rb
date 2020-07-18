class AddTwoDaysAgoToProgresses < ActiveRecord::Migration[6.0]
  def change
    add_column :progresses, :twodaysago, :string
  end
end
