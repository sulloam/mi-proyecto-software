# frozen_string_literal: true

class Course < ApplicationRecord
  # Relación con el profesor
  belongs_to :professor, class_name: 'User', foreign_key: 'professor_id'

  # Validaciones
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_vacancies, numericality: { only_integer: true, greater_than: 0 }
  validates :code, presence: true, uniqueness: true # Asegura que el código del curso sea único

  # Relaciones adicionales
  has_many :enrollments
  has_many :students, through: :enrollments, source: :user

  has_many :materials
  has_many :tests
  has_many :course_reviews

  # Métodos adicionales para lógica del curso
  def available_slots
    total_vacancies - enrollments.where(status: 'aceptado').count
  end
end
