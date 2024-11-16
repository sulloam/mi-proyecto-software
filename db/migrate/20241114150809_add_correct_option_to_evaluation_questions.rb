class AddCorrectOptionToEvaluationQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluation_questions, :correct_option, :string
  end
end
