class CreateClosestVenues < ActiveRecord::Migration
  def change
    create_table :closest_venues do |t|
      t.integer :person_id
      t.integer :venue_id
      t.integer :position

      t.timestamps
    end
  end
end
