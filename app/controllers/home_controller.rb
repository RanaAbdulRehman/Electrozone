class HomeController< ApplicationController
    before_action :authenticate_user!, :delete_trash
    def index
        
    end

    private 
    def delete_trash
        @orders = Order.where(address: nil)
        @orders.each do |order|
            order.order_items.each do |order_item|
                order_item.destroy
            end
            order.destroy
        end
    end
end