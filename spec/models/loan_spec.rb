require 'rails_helper'

RSpec.describe Loan, type: :model do
  # テストの対象
  describe 'scope' do
    let(:user) { FactoryBot.create(:user) }
    let!(:loan) { FactoryBot.create(:loan, user_id: user.id) }

    describe 'search' do
    end

    describe 'family_form_is' do
      # describe_class = Loan family_formの検索をする
      subject { described_class.family_form_is(family_form) }
      # どういう状態でテストするか
      context '検索条件に一致する値を渡す' do
        # subjectの値をfamily_formに格納
        let(:family_form) { loan.family_form }
        # 上記の値が含まれるかを調査
        it do
          is_expected.to include loan
        end
      end
      context '検索条件に一致しない値を渡す' do
        let(:family_form) { loan.family_form + 'a' }
        
        it do
          byebug
          is_expected.to_not include loan
        end
      end
    end
  end
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.build(:user) }
    let!(:loan) { FactoryBot.build(:loan, user_id: user.id) }
    subject { loan.valid? }

    context 'ageカラム' do
      it '空欄の場合はバリデーションがかかること' do
        loan.age = ''
        is_expected.to be_falsey
      end
    end

    context 'sexカラム' do
      before { loan.sex = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'family_formカラム' do
      it '空欄でないこと' do
        loan.family_form = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end

    context 'employment_statusカラム' do
      it '空欄でないこと' do
        loan.employment_status = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'job_periodカラム' do
      it '空欄でないこと' do
        loan.job_period = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'incomeカラム' do
      it '空欄でないこと' do
        loan.income = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'listedカラム' do
      it '空欄でないこと' do
        loan.listed = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'borrowing_yearカラム' do
      it '空欄でないこと' do
        loan.borrowing_year = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'borrowing_monthカラム' do
      it '空欄でないこと' do
        loan.borrowing_month = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'bank_idカラム' do
      it '空欄でないこと' do
        loan.bank_id = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'rateカラム' do
      it '空欄でないこと' do
        loan.rate = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'borrowing_amountカラム' do
      it '空欄でないこと' do
        loan.borrowing_amount = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'borrowing_periodカラム' do
      it '空欄でないこと' do
        loan.borrowing_period = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'paymentカラム' do
      it '空欄でないこと' do
        loan.payment = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'rate_typeカラム' do
      it '空欄でないこと' do
        loan.rate_type = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'borrowing_formカラム' do
      it '空欄でないこと' do
        loan.borrowing_form = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'bought_placeカラム' do
      it '空欄でないこと' do
        loan.bought_place = ''
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
    context 'reasonカラム' do
      it '空欄でないこと' do
        loan.reason = ''
      end
      it '10文字以上であること' do
        loan.reason = Faker::Lorem.characters(number: 5)
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Loan.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

  #検索のテストを入れる予定
end
