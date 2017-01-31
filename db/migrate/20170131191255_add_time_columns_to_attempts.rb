class AddTimeColumnsToAttempts < ActiveRecord::Migration[5.0]
  def change
    add_column :attempts, :end_time, :datetime
  end
end
