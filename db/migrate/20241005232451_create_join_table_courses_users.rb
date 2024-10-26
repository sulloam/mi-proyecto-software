# frozen_string_literal: true

class CreateJoinTableCoursesUsers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :courses, :users do |t|
      # t.index [:course_id, :user_id]
      # t.index [:user_id, :course_id]
    end
  end
end
