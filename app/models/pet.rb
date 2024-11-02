class Pet < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :name, presence: true
    validates :breed, presence: true
    validates :address, presence: true
    validates :image_url, presence: true
    validates :description, length: { maximum: 500 }
end
