class AddDetailstoReservations < ActiveRecord::Migration[7.2]
  def change
    add_column :reservations, :status, :string
    add_column :reservations, :start_date, :date
    add_column :reservations, :end_date, :date
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :pets, null: false, foreign_key: true
  end
end
