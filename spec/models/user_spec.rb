require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Loanモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:loans).macro).to eq :has_many
      end
    end

    context 'Couponモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:coupons).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Bankモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:banks).macro).to eq :has_many
      end
    end
  end
end
