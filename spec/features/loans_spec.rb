require 'rails_helper'

RSpec.feature "Loans", type: :feature do
  # ユーザーは新しいプロジェクトを作成する
  scenario "user creates a new loan" do
    # ユーザーを作成
    @user = User.create(
      email: "test@example.com",
      password: "test123"
    )
    
    # トップページへアクセス
    visit root_path
    
    # サインインページへ遷移
    click_link "ログイン"

    # メアドとパスワードを入力してログイン
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "ログインする"


    # タスク作成時に、@userのタスクが1つ増えることを記載
    expect {
      # タスク作成ページへ遷移
      click_link "こちらからクーポンゲット！"

      # 入力し、次へボタンをクリック
      fill_in "年齢", with: "30"
      choose "男性"
      choose "夫婦"
      choose "正社員"
      choose "3年以上"
      fill_in "年収", with: "500"
      choose "上場企業"
      click_button "次へ"

      # 入力し、次へボタンをクリック
      fill_in "借入時期", with: "2020"
      fill_in "借入時期", with: "1"
      select "みずほ銀行", from: "銀行名"
      fill_in "実行金利", with: "0.6"
      fill_in "借入金額", with: "4000"
      fill_in "借入年数", with: "35"
      fill_in "返済月額", with: "92000"
      choose "変動"
      choose "単独債務"
      select "東京都", from: "家を購入した場所"
      fill_in "銀行を選んだ理由とアドバイス", with: "金利が安く、担当者の印象もよかったため"
      click_button "確認画面へ"

      click_button "送信する"

      # タスク作成成功のフラッシュメッセージが表示されること
      expect(page).to have_content "ご回答ありがとうございました！"
    }.to change(@user.loans, :count).by(1)
  end
end
