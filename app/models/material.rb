# frozen_string_literal: true

class Material < ApplicationRecord
  validates :title, presence: true
  validates :information, presence: true
  validates :number, presence: true

  belongs_to :course
end
