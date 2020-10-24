class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :user_id, null: false
      t.integer :age, null: false
      t.integer :sex, null: false, default: 0
      t.integer :family_form, null: false, default: 0
      t.integer :employment_status, null: false, default: 0
      t.integer :job_period, null: false, default: 0
      t.integer :listed, null: false, default: 0
      t.integer :borrowing_year, null: false
      t.integer :borrowing_month, null: false
      t.integer :bank_id, null: false
      t.float :rate, null: false
      t.integer :borrowing_period, null: false
      t.integer :payment, null: false
      t.integer :rate_type, null: false, default: 0
      t.integer :borrowing_form, null: false, default: 0
      t.integer :bought_place, null: false, default: 0
      t.integer :borrowing_amount, null: false
      t.integer :income, null: false
      t.text :reason, null: false
      t.timestamps
    end
  end
end
