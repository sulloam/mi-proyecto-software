# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :status, presence: true, inclusion: { in: %w[pendiente aceptado rechazado] }
  validates :user_id, uniqueness: { scope: :course_id, message: 'ya tiene una solicitud para este curso' }

  # Método para cambiar el estado de inscripción
  def accept
    update(status: 'aceptado')
  end

  def reject
    update(status: 'rechazado')
  end
end
