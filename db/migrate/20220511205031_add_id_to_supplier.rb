class AddIdToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :suppliers_id, :integer
  end
end
