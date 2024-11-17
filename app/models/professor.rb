# frozen_string_literal: true

class Professor < ApplicationRecord
  belongs_to :course
  belongs_to :user

  has_many :messages
  has_many :reviews, as: :reviewable, dependent: :destroy
end
