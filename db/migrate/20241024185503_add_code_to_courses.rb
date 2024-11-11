# frozen_string_literal: true

class AddCodeToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :code, :string
  end
end
