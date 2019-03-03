class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :chat_room
  belongs_to :user

  validates :content, presence: true, length: {minimum: 2, maximum: 1000}
end
