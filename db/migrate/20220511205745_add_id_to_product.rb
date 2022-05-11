class AddIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :suppliers_id, :integer
  end
end
