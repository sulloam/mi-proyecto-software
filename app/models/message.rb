class Message < ApplicationRecord

  validates :info, presence: true

  belongs_to :chat
  belongs_to :student
  belongs_to :professor
end
