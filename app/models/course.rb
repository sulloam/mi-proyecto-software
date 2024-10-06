class Course < ApplicationRecord

  validates :name, presence: true
  validates :desciption, presence: true
  validates :mode, presence: true
  
  
  has_and_belongs_to_many :users
  has_one :professor
  has_many :students
  has_one :chat
  

end
