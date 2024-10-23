class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :courses
  has_many :professors
  has_many :students
  has_one_attached :photo

  # Relaciones nuevas
  has_many :enrollments
  has_many :courses_as_professor, class_name: 'Course', foreign_key: 'professor_id'
  has_many :courses_as_student, through: :enrollments, source: :course

  # Validations
  validates :rol, presence: true, inclusion: { in: %w[profesor estudiante], message: "%{value} no es un rol válido" }
  validates :phone_number, format: { with: /\A\+?\d{10,15}\z/, message: "número inválido (debe tener entre 10 y 15 dígitos)" }, allow_blank: true
end
