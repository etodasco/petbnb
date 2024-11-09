class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validates :status, inclusion: { in: ['pending', 'accepted', 'declined'] }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
def self.pet_available?(pet, start_date, end_date)
    Reservation.where(pet_id: pet.id)
               .where("start_date < ? AND end_date > ?", end_date, start_date)
               .empty?
  end
end
