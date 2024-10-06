class Student < ApplicationRecord

  validates :finished, presence: true

  belongs_to :course
  belongs_to :user
end
