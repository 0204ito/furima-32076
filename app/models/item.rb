class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :info
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :sales_status_id 
  validates :shipping_free_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id

  
  belong_to :user

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
  
end