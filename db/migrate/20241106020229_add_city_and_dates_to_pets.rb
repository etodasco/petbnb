class AddCityAndDatesToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :city, :string
    add_column :pets, :start_date, :date
    add_column :pets, :end_date, :date
  end
end
