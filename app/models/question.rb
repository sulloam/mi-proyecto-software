# frozen_string_literal: true

class Question < ApplicationRecord
  validates :statement, presence: true
  validates :score, presence: true

  belongs_to :test
end
