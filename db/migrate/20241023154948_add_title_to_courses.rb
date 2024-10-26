# frozen_string_literal: true

class AddTitleToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :title, :string
  end
end
