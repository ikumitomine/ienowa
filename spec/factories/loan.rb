#Fakerでローンの投稿を作成
FactoryBot.define do
  factory :loan do
    age { 30 }
    sex { "male" }
    family_form { "couple" }
    employment_status { "regular" }
    job_period { "more3year" }
    income { 600 }
    listed { "listed" }
    borrowing_year { 2020 }
    borrowing_month { 12 }
    bank_id { 1 }
    rate { 0.6 }
    borrowing_amount { 4000 }
    borrowing_period { 35 }
    payment { 100000 }
    rate_type { "fluctuation" }
    borrowing_form { "alone" }
    bought_place { "tokyo" }
    reason { "金利が安く担当者の印象もよかったから" }
    user
  end
end