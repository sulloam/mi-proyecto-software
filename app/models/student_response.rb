class StudentResponse < ApplicationRecord
  belongs_to :evaluation
  belongs_to :student, class_name: 'User', foreign_key: 'student_id'
  has_many :answers, dependent: :destroy

  validates :evaluation_id, :student_id, presence: true
end
