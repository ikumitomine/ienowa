class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google)

  has_many :coupons, dependent: :destroy
  has_many :loans

  has_many :banks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favoriteのbank_idを使ってbankテーブルと繋がる
  # fav_bankテーブルはないのでsourceで参照するモデルをbankと指定する
  has_many :fav_banks, through: :favorites, source: :bank

  # is_activeがtrueの場合は有効会員
  def active_for_authentication?
    super && (self.is_active == true)
  end

  protected
  def self.find_for_google(auth)
    user = User.find_by( email: auth.info.email)

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        token: auth.credentials.token,
        email: auth.info.email
        )
    end
    user
  end

end
