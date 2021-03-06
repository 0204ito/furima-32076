class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :info
    validates :images  # アソシエーションを変更したらバリデーションも変更
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_free_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_free_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scheduled_delivery

  belongs_to :user
  # has_one_attached :image
  has_many_attached :images # 複数枚の画像保存のためアソシエーション変更
  has_one :purchase

  def self.search(search)
    if search != '' # 検索ワードが空でなければ実行
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
