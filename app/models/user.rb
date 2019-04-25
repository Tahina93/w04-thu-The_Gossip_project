class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :recipient_to_pm_links, foreign_key: 'recipient_id'
  has_many :received_messages, foreign_key: 'received_message_id', class_name: "PrivateMessage", through: :recipient_to_pm_links
end
