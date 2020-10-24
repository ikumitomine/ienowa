class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coupons
  has_many :loans

  has_many :favorites, dependent: :destroy
  # favoriteのbank_post_idを使ってbank_postsテーブルと繋がる。fav_postsテーブルはないのでsourceでどのテーブルを参照するのかを指定する
  has_many :fav_banks, through: :favorites, source: :bank
end
