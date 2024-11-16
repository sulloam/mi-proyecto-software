class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :evaluation_questions, dependent: :destroy
  has_many :student_responses, dependent: :destroy
  accepts_nested_attributes_for :evaluation_questions, allow_destroy: true

  # Método para obtener la puntuación de un alumno
  def student_score(student)
    response = student_responses.find_by(student: student)
    response&.score || 0
  end
end
