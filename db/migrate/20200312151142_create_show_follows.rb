class CreateShowFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :show_follows do |t|
      t.integer :show_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
