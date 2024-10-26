# frozen_string_literal: true

class CourseReview < ApplicationRecord
  validates :score, presence: true
  validates :comment, presence: true

  belongs_to :student
  belongs_to :course
end
