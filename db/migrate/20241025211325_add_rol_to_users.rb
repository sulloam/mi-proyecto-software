# frozen_string_literal: true

class AddRolToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rol, :string
  end
end
