require 'rails_helper'

RSpec.describe "Loans", type: :request do
  let(:user) { create(:user) }
  # userをcreateし、let内に格納

  describe '検索ページ' do
    context "検索ページが正しく表示される" do
      before do
        get loans_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do 
        login_user user
        get new_loan_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end