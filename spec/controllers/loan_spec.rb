require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let!(:user) { create(:user) }
  # userをcreateし、let内に格納

  describe '検索のテスト' do
    context '検索ページが正しく表示される' do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '投稿のテスト' do
    before do
      login_user user
      get :new
      # controller_macros.rb内のlogin_userメソッドを呼び出し
    end

    context '新規投稿ページが正しく表示される' do
      it 'リクエストは200 OKとなること' do
        expect(response).to render_template :new
      end
    # context "１ページ目の入力がsessionに保存される" do


    end
  end
end