class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone_number
      t.integer :selected_venue_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
