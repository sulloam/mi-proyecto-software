class Student < ApplicationRecord

  validates :finished, presence: true

  belongs_to :course
  belongs_to :user
  has_many :tests
  has_many :messages
end
