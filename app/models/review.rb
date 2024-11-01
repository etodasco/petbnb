class Review < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :comment, presence: true
end
