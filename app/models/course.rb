class Course < ApplicationRecord
  # Validaciones
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_slots, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mode, presence: true

  # Relaciones
  belongs_to :professor, class_name: 'User', foreign_key: 'professor_id'
  has_many :enrollments
  has_many :students, through: :enrollments, source: :user

  has_many :materials
  has_many :tests
  has_many :course_reviews

  # Métodos adicionales para lógica del curso
  def available_slots
    total_slots - enrollments.where(status: 'aceptado').count
  end
end
