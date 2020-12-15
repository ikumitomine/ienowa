class LoansController < ApplicationController
  before_action :signed_in_user, only: [:new, :next]
  before_action :validates_new, only: :next # newのバリデーション
  before_action :validates_next, only: :confirm # nextのバリデーション

  def new
    @loan = Loan.new
  end

  def next
    @loan = Loan.new
    @banks = Bank.all
  end

  def validates_new
    # 初期画面で入力された値をsessionに保存
    session[:age] = loan_params[:age]
    session[:sex] = loan_params[:sex]
    session[:family_form] = loan_params[:family_form]
    session[:employment_status] = loan_params[:employment_status]
    session[:job_period] = loan_params[:job_period]
    session[:income] = loan_params[:income]
    session[:listed] = loan_params[:listed]
    # バリデーション用に仮でインスタンスを作成する
    @loan = Loan.new(
      age: session[:age],
      sex: session[:sex],
      family_form: session[:family_form],
      employment_status: session[:employment_status],
      job_period: session[:job_period],
      income: session[:income],
      listed: session[:listed],
      user_id: current_user.id
      )
    # 仮で作成したインスタンスのバリデーションチェックを行い、通らなければnewページに遷移する
    render 'loans/new' unless @loan.valid?(:validates_new)
  end

  def validates_next
    # nextで入力された値をsessionに保存
    session[:borrowing_year] = next_params[:borrowing_year]
    session[:borrowing_month] = next_params[:borrowing_month]
    session[:bank_id] = next_params[:bank_id]
    session[:rate] = next_params[:rate]
    session[:borrowing_amount] = next_params[:borrowing_amount]
    session[:borrowing_period] = next_params[:borrowing_period]
    session[:payment] = next_params[:payment]
    session[:rate_type] = next_params[:rate_type]
    session[:borrowing_form] = next_params[:borrowing_form]
    session[:bought_place] = next_params[:bought_place]
    session[:reason] = next_params[:reason]
    # バリデーション用に仮でインスタンスを作成
    @loan = Loan.new(
      user_id: current_user.id,
      borrowing_year: session[:borrowing_year],
      borrowing_month: session[:borrowing_month],
      bank_id: session[:bank_id],
      rate: session[:rate],
      borrowing_amount: session[:borrowing_amount],
      borrowing_period: session[:borrowing_period],
      payment: session[:payment],
      rate_type: session[:rate_type],
      borrowing_form: session[:borrowing_form],
      bought_place: session[:bought_place],
      reason: session[:reason]
      )
    @banks = Bank.all
    # 仮で作成したインスタンスのバリデーションチェックを行い、通らなければnextページに遷移する
    render 'loans/next' unless @loan.valid?(:validates_next)
  end

  def confirm
    @bank = Bank.find(next_params[:bank_id])
  end

  def create
    # newとnextの値をloanテープルに保存
  @loan = Loan.new(
    user_id: current_user.id,
    age: session[:age],
    sex: session[:sex],
    family_form: session[:family_form],
    employment_status: session[:employment_status],
    job_period: session[:job_period],
    income: session[:income],
    listed: session[:listed],
    borrowing_year: session[:borrowing_year],
    borrowing_month: session[:borrowing_month],
    bank_id: session[:bank_id],
    rate: session[:rate],
    borrowing_amount: session[:borrowing_amount],
    borrowing_period: session[:borrowing_period],
    payment: session[:payment],
    rate_type: session[:rate_type],
    borrowing_form: session[:borrowing_form],
    bought_place: session[:bought_place],
    reason: session[:reason]
    )
    @loan.score = Language.get_data(@loan.reason)
    if @loan.save
      #ローンの投稿が保存されたら、current_userに期限付きのクーポンを発行する
      Coupon.coupon_create(current_user, 365)
      redirect_to loans_complete_path
    else
      render 'loans/new'
    end
  end

  def complete
  end

  def index
    @search_params = loan_search_params
    # 検索条件にあてはまる値を@loansに代入
    @loans = Loan.search(@search_params).includes(:bank).page(params[:page]).order("borrowing_year DESC").order("borrowing_month DESC").per(5)
  end

  def show
    @loan = Loan.find(params[:id])
  end


  private
  def loan_params
    # 初期画面で入力された値のパラメータ設定
    params.require(:loan).permit(
      :user_id,
      :age,
      :sex,
      :family_form,
      :employment_status,
      :job_period,
      :income,
      :listed
      )
  end

  def next_params
    # next画面で入力された値のパラメータ設定
    params.require(:loan).permit(
      :borrowing_year,
      :borrowing_month,
      :bank_id,
      :rate,
      :borrowing_amount,
      :borrowing_period,
      :payment,
      :rate_type,
      :borrowing_form,
      :bought_place,
      :reason,
      :score
      )
  end

  def loan_search_params
    # 検索のパラメータ設定
      if params[:search]
        params.fetch(:search, {}).permit(
          :family_form,
          :employment_status,
          :job_period,
          :bought_place,
          :age_from,
          :age_to,
          :income_from,
          :income_to
        )
    else
      # 検索後に銀行一覧から投稿一覧へ戻るときに検索条件を保持させるためのパラメータ
      params.permit(
        :family_form,
        :employment_status,
        :job_period,
        :bought_place,
        :age_from,
        :age_to,
        :income_from,
        :income_to
      )
    end
  end

  # 直打ち防止のbefore_action
  def signed_in_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end