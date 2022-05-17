class Product < ApplicationRecord   
    validates :name, presence: true
    validates :price, presence: true
    validates :price, numericality: {greater_than: 0 }
    validates :description, presence: true
    validates :description, length: { in: 10..500}
    belongs_to :supplier
    has_many :images
    has_many :orders
    has_many :category_products
    has_many :categories, through: :category_product
    
    def is_discounted?
        price < 10
      end
    
      def tax
        (price * 0.09).round(2)
      end
    
      def total
        (price + tax).round(2)
      end
      # supplier
      #   Supplier.find_by(id: supplier_id)
      # end
      #  images
      #   Image.where(product_id: id)
      # end
      # def categories
      #   categories_array = []
      #   category_products.each do |category_product|
      #     categories_array << category_product.category
      #   end
      #   return categories_array
      # end
  end
