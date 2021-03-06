class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    redirect_to items_path if @item.destroy
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_free_status_id, :prefecture_id, :scheduled_delivery_id, images: []).merge(user_id: current_user.id)
  end # images: []最後尾に書かなくてはいけない

  def set_item
    @item = Item.find(params[:id])
  end
end
