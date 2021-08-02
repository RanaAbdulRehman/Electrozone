class SessionsController < Devise::SessionsController
    def new
      super
    end
  
    def create
      super  
    end
  
    def destroy
      super
      @orders = Order.where(address: nil)
      @orders.each do |order|
        order.order_items.each do |order_item|
            order_item.destroy
        end
        order.destroy
      end
    end
  end 