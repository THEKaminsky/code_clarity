class CreateAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :attempts do |t|
      t.integer :user_id, index: true, null: false
      t.integer :answer_option_id, index: true
      t.integer :question_id, index: true, null: false
      t.datetime :start_time, null: false
      t.float :duration_in_seconds
      t.timestamps
    end
  end
end
