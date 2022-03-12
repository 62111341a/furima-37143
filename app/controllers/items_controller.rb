class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @items = Item.all.order("created_at DESC")
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
  def show
    @item= Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
    if @item.save
  else
    render :new
  end
end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end
  private

  def item_params
    params.require(:item).permit(:category_id, :delivery_charge_id, :goods_situation_id, :shipping_day_id,
                                 :shipping_source_id, :goods, :goods_explanation, :price, :image).merge(user_id: current_user.id)
  end
end


