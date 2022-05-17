class Product < ApplicationRecord   
    validates :name, presence: true
    validates :price, presence: true
    validates :price, numericality: {greater_than: 0 }
    validates :description, presence: true
    validates :description, length: { in: 10..500}
    belongs_to :supplier
    has_many :images
    has_many :orders
    def is_discounted?
        price < 10
      end
    
      def tax
        (price * 0.09).round(2)
      end
    
      def total
        (price + tax).round(2)
      end
      # def supplier
      #   Supplier.find_by(id: supplier_id)
      # end
      # def images
      #   Image.where(product_id: id)
      # end
  end
