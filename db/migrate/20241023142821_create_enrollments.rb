class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :status, default: 'pendiente'

      t.timestamps
    end

    add_index :enrollments, [:user_id, :course_id], unique: true
  end
end
