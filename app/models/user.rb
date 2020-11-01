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
    user = User.where(uid: auth.uid, provider: auth.provider).first

    # 上記で取得したユーザデータがレコードに存在しない場合は、作成する
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        # uidとproviderの組み合わせが一意であることを利用しダミーのメールアドレスを生成する
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
        )
    end
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
