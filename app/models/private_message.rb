class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :recipient_to_pm_links
  has_many :recipients, foreign_key: 'recipient_id', class_name: "User", through: :recipient_to_pm_links
end
