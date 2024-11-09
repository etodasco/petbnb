class AddAvailabilityToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :available_from, :date
    add_column :pets, :available_to, :date
  end
end
