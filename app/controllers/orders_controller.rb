class OrdersController < ApplicationController
  def index
    @order =Order.new
    @item = Item.find(params[:item_id])#item販売者のuser情報は取得できている
    #orderのindex画面で、結びつくitemを表示したい。特定のレコードをDBから取得したい。Itemsコントローラーじゃないから、きちんと○○のidと指定する必要がある
    #user = User.find(params[:current_user_id])#カレントユーザー＝購入者の情報を取得したい
  end

  def create
    @item = Item.find(params[:item_id])
    @order =Order.new (order_params)
    @order.save#そしたら保存してね
    if @order.valid?#バリデーションを通過してるか
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  # 全てのストロングパラメーターを1つに統合
 def order_params
  params.require(:order).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone ).merge(user_id: current_user.id,item_id: params[:item_id])
 end#ユーザー、アイテム、の記載はいらないのか？
#購入者＝currentユーザーの情報も紐付けたい。
end
