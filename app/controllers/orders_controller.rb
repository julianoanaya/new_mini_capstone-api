class OrdersController < ApplicationController
    def create
        if current_user
            product = Product.find_by(id: params[:product_id])
            order = Order.new(
            product_id: params[:product_id],
            quantity: params[:quantity],
            user_id: current_user.id,
            subtotal: product.total * params[:quantity],
            tax: product.tax * params[:quantity],
            total: product.total
        )
            order.save
            render json: order.as_json
        else
            render json: {errors: order.errors.full_messages}, status: :bad_request
        end
    end
    def index
        orders = current_user.orders
        render json: orders.as_json
    end
    def show
        order = current_user.orders.find_by(id: params[:id])
        render json: ordeer.as_json
    end
end

# else
#     render json: { errors: order.errors.full_messages }, status: :bad_request
# end
# end