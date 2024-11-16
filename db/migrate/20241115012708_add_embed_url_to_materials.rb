class AddEmbedUrlToMaterials < ActiveRecord::Migration[7.1]
  def change
    add_column :materials, :embed_url, :string
  end
end
