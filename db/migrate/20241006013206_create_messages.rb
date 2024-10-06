class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :info
      t.references :chat, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :professor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
