class CreateRsvpOptions < ActiveRecord::Migration
  def change
    create_table :rsvp_options do |t|
      t.string :option_name
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
