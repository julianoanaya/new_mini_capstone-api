class RemoveIdToSupplier < ActiveRecord::Migration[7.0]
  def change
    remove_column :suppliers, :suppliers_id, :integer
  end
end
