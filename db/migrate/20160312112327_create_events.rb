class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :place
      t.integer :category_id
      t.integer :ticket
      t.integer :ticket_amount
      t.string :expire_date
      t.integer :user_id
      t.string :attachment

      t.timestamps null: false
    end
  end
end
