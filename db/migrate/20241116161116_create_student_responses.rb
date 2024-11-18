class CreateStudentResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :student_responses do |t|
      t.references :evaluation, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :users } # Corrección aquí

      t.timestamps
    end
  end
end
