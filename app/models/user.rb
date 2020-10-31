class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :trackable, :omniauthable, omniauth_providers: %i(google)

  has_many :coupons, dependent: :destroy
  has_many :loans

  has_many :banks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favoriteのbank_idを使ってbankテーブルと繋がる
  # fav_bankテーブルはないのでsourceで参照するモデルをbankと指定する
  has_many :fav_banks, through: :favorites, source: :bank

  protected
  def self.find_for_google(auth)
    user = User.where( uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        token: auth.credentials.token,
        email: auth.info.email,
        encrypted_password: Devise.friendly_token[0, 20],
        meta: auth.to_yaml
        )
    end
    user
  end
  # private
  # def self.dummy_email(auth)
  #   "#{auth.uid}-#{auth.provider}@example.com"
  # end
end
