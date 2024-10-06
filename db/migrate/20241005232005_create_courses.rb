# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :mode
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
