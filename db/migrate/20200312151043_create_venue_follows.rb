class CreateVenueFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :venue_follows do |t|
      t.integer :venue_id
      t.integer :fan_id

      t.timestamps
    end
  end
end
