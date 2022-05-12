class RenameSuppliersToSupplier < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :suppliers_id, :supplier_id
  end
end
# this changes in products