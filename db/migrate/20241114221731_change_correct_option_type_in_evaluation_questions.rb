class ChangeCorrectOptionTypeInEvaluationQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column :evaluation_questions, :correct_option, :string
  end
end
