class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer :user_id, index: true
      t.integer :answer_option_id, index: true
      t.timestamps
    end
  end
end
