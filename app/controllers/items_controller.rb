class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    def index
        @items = Item.order("created_at DESC")
      end
      def new
        @item = Item.new
      end
      def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to root_path
        else
          render :new
        end
      end
      private

      def item_params
        params.require(:item).permit(:category, :delivery_charge, :goods_situation, :shipping_day, :shipment_source, :image).merge(user_id: current_user.id)
      end

end
