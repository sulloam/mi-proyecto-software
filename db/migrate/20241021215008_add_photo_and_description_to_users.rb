# frozen_string_literal: true

class AddPhotoAndDescriptionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :description, :text
  end
end
