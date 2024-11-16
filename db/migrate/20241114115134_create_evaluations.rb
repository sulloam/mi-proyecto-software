class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.text :description
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
