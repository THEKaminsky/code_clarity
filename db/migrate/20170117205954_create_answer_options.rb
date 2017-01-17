class CreateAnswerOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_options do |t|
      t.integer :question_id, index: true
      t.text :content, null: false
      t.boolean :is_correct, default: false
      t.timestamps
    end
  end
end
