class AddDetailsToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :description, :text
    add_column :pets, :name, :string
    add_column :pets, :breed, :string
    add_column :pets, :address, :string
    add_reference :pets, :user, null: false, foreign_key: true
  end
end
