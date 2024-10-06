class Professor < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :messages
end
