class EvaluationQuestion < ApplicationRecord
  belongs_to :evaluation
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options

  validates :content, presence: true
  validates :correct_option, presence: true # Validamos que la opción correcta esté presente
end
