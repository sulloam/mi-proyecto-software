# frozen_string_literal: true

class CreateProfessorReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :professor_reviews do |t|
      t.integer :score
      t.text :comment
      t.references :student, null: false, foreign_key: true
      t.references :professor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
