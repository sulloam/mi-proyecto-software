class FixStudentForeignKeyOnStudentResponses < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :student_responses, :students
    add_foreign_key :student_responses, :users, column: :student_id
  end
end
