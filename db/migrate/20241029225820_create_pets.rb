class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.timestamps
    end
  end
end
