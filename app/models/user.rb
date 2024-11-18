class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :courses
  has_many :enrollments, dependent: :destroy
  has_many :courses_as_professor, class_name: 'Course', foreign_key: 'professor_id'
  has_many :courses_as_student, through: :enrollments, source: :course
  has_many :reviews, as: :reviewable, dependent: :destroy # Relación polimórfica

  # Se asegura de que Active Storage esté disponible
  has_one_attached :photo

  # Validaciones
  validates :rol, presence: true, inclusion: { in: %w[profesor estudiante], message: "%{value} no es un rol válido" }
  validates :phone_number, format: { with: /\A\+?\d{10,15}\z/, message: "número inválido (debe tener entre 10 y 15 dígitos)" }, allow_blank: true

  # Método para obtener el nombre completo
  def full_name
    "#{first_name} #{last_name}"
  end
end

