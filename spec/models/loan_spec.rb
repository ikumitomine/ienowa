require 'rails_helper'

RSpec.describe Loan, type: :model do
  # テストの対象
  describe 'search_scope' do
    let(:user) { FactoryBot.create(:user) }
    let!(:loan) { FactoryBot.create(:loan, user_id: user.id) }

    describe 'family_form_is' do
      # 「describe_class = Loan」のfamily_formの検索をする
      subject { described_class.family_form_is(family_form) }
      # どういう状態でテストするか
      context '検索条件に一致する値を渡す' do
        # subjectの値をfamily_formに格納
        let(:family_form) { loan.family_form }
        # 上記の値が含まれるかをテスト
        it do
          is_expected.to include loan
        end
      end
      context '検索条件に一致しない値を渡す' do
        let(:family_form) { loan.family_form + 'a' }
        it do
          is_expected.to_not include loan
        end
      end
    end

    describe 'employment_status_is' do
      subject { described_class.employment_status_is(employment_status) }
      context '検索条件に一致する値を渡す' do
        let(:employment_status) { loan.employment_status }
        it do
          is_expected.to include loan
        end
      end
      context '検索条件に一致しない値を渡す' do
        let(:employment_status) { loan.employment_status + 'a' }
        it do
          is_expected.to_not include loan
        end
      end
    end

    describe 'job_period_is' do
      subject { described_class.job_period_is(job_period) }
      context '検索条件に一致する値を渡す' do
        let(:job_period) { loan.job_period }
        it do
          is_expected.to include loan
        end
      end
      context '検索条件に一致しない値を渡す' do
        let(:job_period) { loan.job_period + 'a' }
        it do
          is_expected.to_not include loan
        end
      end
    end

    describe 'bought_place_is' do
      subject { described_class.bought_place_is(bought_place) }
      context '検索条件に一致する値を渡す' do
        let(:bought_place) { loan.bought_place }
        it do
          is_expected.to include loan
        end
      end
      context '検索条件に一致しない値を渡す' do
        let(:bought_place) { loan.bought_place + 'a' }
        it do
          is_expected.to_not include loan
        end
      end
    end

    describe 'age_from' do
      subject { described_class.age_from(age_from) }
      subject { described_class.age_to(age_to) }

      context '検索条件に一致する値を渡す' do
        let!(:age_from)    { "25" }
        let!(:age_to)      { "35" }
        it '検索条件に含まれる' do
          is_expected.to include loan.age
        end
      end
      # context '検索条件に一致しない値を渡す' do
      #   let(:age) { loan.age < loan.age_from }
      #   it do
      #     is_expected.to_not cover loan
      #   end
      # end
    end
  end
  
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.build(:user) }
    let!(:loan) { FactoryBot.build(:loan, user_id: user.id) }
    subject { loan.valid? }

    context 'ageカラム' do
      before { loan.age = '' }
      it '空欄の場合はバリデーションがかかること' do
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
      before { loan.family_form = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'employment_statusカラム' do
      before { loan.employment_status = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'job_periodカラム' do
      before { loan.job_period = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end
    
    context 'incomeカラム' do
      before { loan.income = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'listedカラム' do
      before { loan.listed = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'borrowing_yearカラム' do
      before { loan.borrowing_year = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'borrowing_monthカラム' do
      before { loan.borrowing_month = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'bank_idカラム' do
      before { loan.bank_id = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'rateカラム' do
      before { loan.rate = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'borrowing_amountカラム' do
      before { loan.borrowing_amount = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'borrowing_periodカラム' do
      before { loan.borrowing_period = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end
    
    context 'paymentカラム' do
      before { loan.payment = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'rate_typeカラム' do
      before { loan.rate_type = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end
    
    context 'borrowing_formカラム' do
      before { loan.borrowing_form = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end

    context 'bought_placeカラム' do
      before { loan.bought_place = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
    end
    
    context 'reasonカラム' do
      before { loan.reason = '' }
      it '空欄の場合はバリデーションがかかること' do
        is_expected.to be_falsey
      end
      it '10文字以上であること' do
        loan.reason = Faker::Lorem.characters(number: 5)
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Loan.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
