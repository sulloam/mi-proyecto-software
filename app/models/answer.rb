class Answer < ApplicationRecord
  belongs_to :student_response
  belongs_to :evaluation_question
  belongs_to :option

  validates :student_response_id, :evaluation_question_id, :option_id, presence: true
end
