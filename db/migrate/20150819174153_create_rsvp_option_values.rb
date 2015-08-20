class CreateRsvpOptionValues < ActiveRecord::Migration
  def change
    create_table :rsvp_option_values do |t|
      t.string :value
      t.belongs_to :rsvp_option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
