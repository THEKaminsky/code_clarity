class AddTimeColumnsToAttempts < ActiveRecord::Migration[5.0]
  def change
    add_column :attempts, :start_time, :datetime, null: false
    add_column :attempts, :duration_in_seconds, :float
  end
end
