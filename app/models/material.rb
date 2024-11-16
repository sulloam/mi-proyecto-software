class Material < ApplicationRecord
  belongs_to :course

  before_save :format_embed_url

  private

  def format_embed_url
    if embed_url.present?
      # Reemplaza cualquier enlace de YouTube por el formato embed
      self.embed_url = embed_url.gsub(/watch\?v=/, 'embed/').gsub(/youtu\.be\//, 'www.youtube.com/embed/')
    end
  end
end
