class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）を入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）を入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを入力してください' }
    validates :birth_date
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: '半角英数字混合を入力してください' }
  end
  has_many :items
  has_many :purchases
end
