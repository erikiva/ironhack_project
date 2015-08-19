class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.belongs_to :event, index: true, foreign_key: true
      t.string :access_hash
      t.string :email

      t.timestamps null: false
    end
  end
end
