class OrderItemsController < ApplicationController

    
    def create
        @order = current_order
        if @order.user_id.nil?
            @order.user_id = current_user.id
        end
        print"Heloooooooooooooooo"
        p @order
        flag = true
        @order.order_items.each do |item|
            if item.product_id == order_params[:product_id].to_i
                @updated_details= order_params
                @updated_details[:quantity] = item.quantity + order_params[:quantity].to_i
                @item_to_be_updated = @order.order_items.find(item.id)
                @item_to_be_updated.update(@updated_details)
                flag = false
                redirect_to products_path
            end
        end
        if flag == true
            @order_item = @order.order_items.new(order_params)
            @order.save
            session[:order_id] = @order.id
        end
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

end
