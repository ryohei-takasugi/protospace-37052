class Comment < ApplicationRecord
  # -------------------------
  # association
  belongs_to :user
  belongs_to :prototype
  # -------------------------
  # validates
  validates :content, presence: true
end
