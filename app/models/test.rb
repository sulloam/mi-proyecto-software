class Test < ApplicationRecord
  
  validates :title, presence: true
  validates :description, presence:true
  
  belongs_to :course
  belongs_to :student


end
