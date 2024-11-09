class Pet < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy
    has_one_attached :image

    validates :name, presence: true
    validates :breed, presence: true
    validates :address, presence: true
    validates :description, length: { maximum: 500 }
    validates :start_date, :end_date, presence: true
    validate :end_date_after_start_date

def end_date_after_start_date
      if end_date && start_date && end_date < start_date
        errors.add(:end_date, "must be after the start date")
      end
    end


    def self.pet_available?(pet_id, start_date, end_date)
      existing_reservations = Reservation.where(pet_id: pet_id)
                                         .where("start_date < ? AND end_date > ?", end_date, start_date)

      existing_reservations.empty?
    end



    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
end
