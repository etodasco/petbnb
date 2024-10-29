class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :is_pet_owner, :boolean
    add_column :users, :name, :string
    add_column :users, :email, :string
  end
end
