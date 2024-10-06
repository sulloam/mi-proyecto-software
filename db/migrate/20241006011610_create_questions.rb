# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :statement
      t.float :score
      t.float :obtained_score
      t.text :answer
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
