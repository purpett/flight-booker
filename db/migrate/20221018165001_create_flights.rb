class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.date :flight_date
      t.integer :flight_time
      t.integer :origin_id
      t.integer :destination_id
      t.integer :duration

      t.timestamps
    end
  end
end
