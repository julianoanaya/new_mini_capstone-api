class ProductsController < ApplicationController
    def index
        @products = Product.all
        render template: "products/index"
      end
    
      def show
        product_id = params[:id]
        @product = Product.find_by(id: product_id)
        render template: "products/show"
      end
    
      def create
        product = Product.new(
          name: params[:name],
          image_url: params[:image_url],
          price: params[:price],
          description: params[:description],
        )
        if product.save
            @product = product
            render template: "products/show"
        else
            render json: { errors: product.eroor.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        product = Product.find_by(id: params[:id])
        product.name = params[:name] || product.name
        product.price = params[:price] || product.price
        product.description = params[:description] || product.description
        if product.save
            @product = product
            render template: "products/show"
        else
            render json: { errors: product.eroor.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        product_id = params[:id]
        product = Product.find_by(id: product_id)
        product.destroy
        render json: { message: "Product has been deleted." }
      end
end
