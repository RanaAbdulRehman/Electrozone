class OrderItemsController < ApplicationController
    after_action :filter_order_items ,only: [:create]
    
    def create
        @order = current_order
        if @order.user_id.nil?
            @order.user_id = current_user.id
        end
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
        
        redirect_to products_path
    end

    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update(order_params)
        
        redirect_to carts_path
    end

    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        redirect_to carts_path
    end

    private
    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end

    def filter_order_items
        order_items = @order.order_items.select { |item|  item.product_id == order_params[:product_id].to_i  }
        if order_items.size>1
            order_items[0].quantity = order_items[0].quantity + order_items[1].quantity
            current_order.order_items.destroy(order_items[1].id)
            current_order.order_items.update(order_items[0].as_json)
        end
    end
end