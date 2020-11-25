class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def index
    @order = Order.new
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchase.nil?
  end

  def create
    @order = Order.new(order_params) # カレントユーザー＝購入者の情報を取得して一緒に保存したい
    if @order.valid? # バリデーションを通過してるか
      pay_item
      @order.save # (order_params)の情報が揃ったら保存してね
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end # ユーザー、アイテム、の記載はいらないのか？#購入者＝currentユーザーの情報も紐付けたい。

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def set_order
    @item = Item.find(params[:item_id]) # item販売者のuser情報は取得できている]
  end # orderのindex画面で、結びつくitemを表示したい。特定のレコードをDBから取得したい。Itemsコントローラーじゃないから、きちんと○○のidと指定する必要がある
end
