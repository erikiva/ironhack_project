class AddUniqueConstraintToGuests < ActiveRecord::Migration
  def change
    add_index :guests, [:email, :event_id], :unique => true
  end
end
