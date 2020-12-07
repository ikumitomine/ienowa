# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '実行開始'

# require 'zengin_code'

# ZenginCode::Bank.all.each do |original_code, original_bank|
#   puts "== #{original_bank.name}"
#   bank = Bank.find_or_initialize_by(code: original_code)
#   bank.name = original_bank.name
#   bank.name_hira = original_bank.hira
#   bank.touch unless bank.new_record?
#   bank.save!
# end

(1..100).each do |i|
  User.create!(email: "test#{i}@gmail.com", password: "asdfg#{i}")
end

# require "csv"
  
# CSV.foreach('db/loans_seed.csv', headers: true) do |row|
#   Loan.create!(
#   user_id: row['user_id'],
#   age: row['age'],
#   sex: row['sex'],
#   family_form: row['family_form'],
#   employment_status: row['employment_status'],
#   job_period: row['job_period'],
#   listed: row['listed'],
#   borrowing_year: row['borrowing_year'],
#   borrowing_month: row['borrowing_month'],
#   bank_id: row['bank_id'],
#   rate: row['rate'],
#   borrowing_period: row['borrowing_period'],
#   payment: row['payment'],
#   rate_type: row['rate_type'],
#   borrowing_form: row['borrowing_form'],
#   bought_place: row['bought_place'],
#   borrowing_amount: row['borrowing_amount'],
#   income: row['income'],
#   reason: row['reason']
#   )
# end

puts 'end'
