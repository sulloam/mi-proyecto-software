class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :status, presence: true, inclusion: { in: %w[pendiente aceptado rechazado] }

  # Método para cambiar el estado de inscripción
  def accept
    update(status: 'aceptado')
  end

  def reject
    update(status: 'rechazado')
  end
end
