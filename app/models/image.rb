class Image < ApplicationRecord
    belongs_to :product
    # Product.where(product_id: ids)
end
