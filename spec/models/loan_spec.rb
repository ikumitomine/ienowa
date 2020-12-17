require 'rails_helper'

RSpec.describe 'Loanモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.build(:user) }
    let!(:loan) { FactoryBot.build(:loan, user_id: user.id) }

    context 'ageカラム' do
      it '空欄でないこと' do
        loan.age = ''
        expect(loan.valid?).to eq false
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end

    context 'sexカラム' do
      it '空欄でないこと' do
        loan.sex = ''
        expect(loan.valid?).to eq false
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end

    context 'family_formカラム' do
      it '空欄でないこと' do
        loan.family_form = ''
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
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
        expect(loan.valid?).to eq false
      end
      it '10文字以上であること' do
        loan.reason = Faker::Lorem.characters(number: 5)
        expect(loan.valid?).to eq false
      end
      # it '空欄の場合はエラーが表示されること' do
      #   loan.age = ''
      #   loan.valid?
      #   expect(loan.errors[:age]).to include("を入力してください")
      # end
    end
  end
end
