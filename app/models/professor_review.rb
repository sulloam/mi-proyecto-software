# frozen_string_literal: true

class ProfessorReview < ApplicationRecord
  validates :score, presence: true
  validates :comment, presence: true

  belongs_to :student
  belongs_to :professor
end
