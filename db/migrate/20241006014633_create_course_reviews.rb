# frozen_string_literal: true

class CreateCourseReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :course_reviews do |t|
      t.integer :score
      t.text :comment
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
