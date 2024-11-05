class Pet < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy

    validates :name, presence: true
    validates :breed, presence: true
    validates :address, presence: true
    validates :image_url, presence: true
    validates :description, length: { maximum: 500 }

    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
end
