class AddOrderToSections < ActiveRecord::Migration
  def change
    add_column :sections, :sort_order, :integer
  end
end
