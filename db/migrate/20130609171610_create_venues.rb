class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :foursquare_id
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
