class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order('created_at DESC')
   
  end

  def new
    @item = Item.new
  end

  def show
    @item=Item.find((params[:id]))
  end

  #def edit
    #item = Item.find(params[:id])
  #end
   
  #def update
    #item = Item.find(params[:id])
    #item.update(item_params)
  #end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
  #end
  
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
end
