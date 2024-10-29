class Pet < ApplicationRecord
    validates :name, presence: true
    validates :breed, presence: true
    validates :address, presence: true
    validates :description, length: { maximum: 500 }
end
