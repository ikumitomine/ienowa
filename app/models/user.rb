class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coupons
  has_many :attribute_posts

  #userとbank_postを中間テーブルfavoriteでつなぐ
  has_many :bank_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # favoriteのbank_post_idを使ってbank_postsテーブルと繋がる。fav_postsテーブルはないのでsourceでどのテーブルを参照するのかを指定する
  has_many :fav_posts, through: :favorites, source: :bank_post
end
