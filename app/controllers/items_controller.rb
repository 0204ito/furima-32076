class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show ,:edit ,:update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
   
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

 def destroy
   item = Item.find(params[:id])
   if item.destroy
    redirect_to items_path
   end
 end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :sales_status_id, :shipping_free_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
