class RenameUserAnswersToAttempts < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_answers, :attempts
  end
end
