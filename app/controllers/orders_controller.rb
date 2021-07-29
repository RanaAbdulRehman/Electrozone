class OrdersController < ApplicationController
  def create
    @order = current_order
    @order.address =  params[:order][:address]
    @order.save
    session[:order_id] = nil
    @order.order_items.each do |order_item|
      product = Product.find(order_item.product_id)
      product.quantity = product.quantity - order_item.quantity
      attrib = Hash.new
      attrib['quantity'] = product.quantity
      product.update(attrib)
    end
  end
end
