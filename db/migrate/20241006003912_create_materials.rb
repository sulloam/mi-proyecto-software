class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :title
      t.text :information
      t.integer :number
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
