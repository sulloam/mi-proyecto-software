# frozen_string_literal: true

class Student < ApplicationRecord
  validates :finished, presence: true

  belongs_to :course
  belongs_to :user
  has_many :tests
  has_many :messages
  has_many :course_reviews
  has_many :professor_reviews
end
