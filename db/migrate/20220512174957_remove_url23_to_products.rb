class RemoveUrl23ToProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image_url_2, :string
    remove_column :products, :image_url_3, :string
  end
end
