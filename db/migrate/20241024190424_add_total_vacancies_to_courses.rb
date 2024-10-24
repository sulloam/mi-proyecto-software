class AddTotalVacanciesToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :total_vacancies, :integer
  end
end
