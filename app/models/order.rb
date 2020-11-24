class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :item_id, :user_id, :token
  #orderコントローラーのストロングパラメーターで取得された値とイコール

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{,11}\z/}
    validates :token
    validates :user_id
    validates :item_id

  end
 
  validates :prefecture_id, numericality: { other_than: 1 }
#orderコントローラーのストロングパラメーターで取得された値にバリデーションをかける。

  def save
    # 購入情報の情報を保存し、「purchase」という変数に入れている(AdressesテーブルはPurchasesテーブルに紐付きデータ取得するため、ここで変数を作り、下でpurchase_idとして受け取れるようにする)
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, purchase_id: purchase.id)
  end#orderコントローラーのストロングパラメーターで取得された値をカラムの値として保存
end
