class SearchController < ApplicationController
    def index
        @products = Product.search_title(params[:title], params[:min_price], params[:max_price])
        @order_item = current_order.order_items.new
        render "products/index"
    end
end
