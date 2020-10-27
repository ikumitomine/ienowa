class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coupons, dependent: :destroy
  has_many :loans

  has_many :banks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favoriteのbank_idを使ってbankテーブルと繋がる
  # fav_bankテーブルはないのでsourceで参照するモデルをbankと指定する
  has_many :fav_banks, through: :favorites, source: :bank
end
