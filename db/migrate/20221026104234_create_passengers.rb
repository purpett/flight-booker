class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :email
      t.integer :booking_id

      t.timestamps
    end
  end
end
