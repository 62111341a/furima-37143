class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all
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
    params.require(:item).permit(:category_id, :delivery_charge_id, :goods_situation_id, :shipping_day_id,
                                 :shipping_source_id, :goods, :goods_explanation, :price, :image).merge(user_id: current_user.id)
  end
end
