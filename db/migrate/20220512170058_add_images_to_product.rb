class AddImagesToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_url_2, :string
    add_column :products, :image_url_3, :string

  end
end
