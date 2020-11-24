class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @order =Order.new
    @item = Item.find(params[:item_id])#item販売者のuser情報は取得できている
    #orderのindex画面で、結びつくitemを表示したい。特定のレコードをDBから取得したい。Itemsコントローラーじゃないから、きちんと○○のidと指定する必要がある
    if current_user.id == @item.user_id
      redirect_to "/items"
     end
  end

  def create
    @item = Item.find(params[:item_id])
    @order =Order.new (order_params)#カレントユーザー＝購入者の情報を取得して一緒に保存したい
    @order.save#(order_params)の情報が揃ったら保存してね
    if @order.valid?#バリデーションを通過してるか
      redirect_to "/items"
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def order_params
  params.require(:order).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone ).merge(user_id: current_user.id,item_id: params[:item_id])
 end#ユーザー、アイテム、の記載はいらないのか？#購入者＝currentユーザーの情報も紐付けたい。
end
