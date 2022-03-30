class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
    def index
        @item_order = ItemOrder.new
        @item=Item.find(params[:item_id])
        if@item.order.present?
          redirect_to root_path
        end
    end
  
    def create
      @item=Item.find(params[:item_id])
        @item_order = ItemOrder.new(item_order_params)
        
    if @item_order.valid?
      Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],    
        currency: 'jpy'                 
      )
      @item_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
    private

  def item_order_params
    params.require(:item_order).permit(:price, :post, :shipping_source_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])  
  end
end

