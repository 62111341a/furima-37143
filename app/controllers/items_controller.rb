class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
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
  end
  def edit
    if@item.order.present?
      redirect_to root_path
    end
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  def update
    if @item.update(item_params)
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
  def set_item
    @item = Item.find(params[:id])
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end


