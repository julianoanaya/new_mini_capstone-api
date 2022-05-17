class OrdersController < ApplicationController
    before_action :authenticate_user

    def create
            product = Product.find_by(id: params[:product_id])
            order = Order.new(
            product_id: params[:product_id],
            quantity: params[:quantity],
            user_id: current_user.id,
            subtotal: product.total * params[:quantity],
            tax: product.tax * params[:quantity],
            total: product.total
        )
        if order.save
            render json: order.as_json
        else
            render json: "unauthorized"
        end
    end
    def index # not working well with unauthorization
        orders = current_user.orders
        render json: orders.as_json
    end

    def show
        order = current_user.orders.find_by(id: params[:id])
        render json: ordeer.as_json
    end
end