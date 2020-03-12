class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :link
      t.string :city

      t.timestamps
    end
  end
end
