# frozen_string_literal: true

class Test < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :course
  belongs_to :student
  has_many :questions
end
