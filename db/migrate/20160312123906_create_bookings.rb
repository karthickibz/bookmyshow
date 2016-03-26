class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :event_id
      t.integer :quantity
      t.integer :amount
      t.integer :user_id
      t.string :status

      t.timestamps null: false
    end
  end
end
