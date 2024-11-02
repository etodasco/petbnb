class UpdateReferenceToReservations < ActiveRecord::Migration[7.2]

  def change
    remove_reference :reservations, :pets, foreign_key: true
    add_reference :reservations, :pet, null: false, foreign_key: true
  end
end
