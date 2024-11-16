class AddScoreToStudentResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :student_responses, :score, :integer
  end
end
