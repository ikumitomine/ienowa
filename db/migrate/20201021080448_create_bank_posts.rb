class CreateBankPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_posts do |t|
      t.integer :user_id, null: false
      t.integer :borrowing_year, null: false
      t.integer :borrowing_month, null: false
      t.string :name, null: false
      t.float :rate, null: false
      t.integer :borrowing_length, null: false
      t.integer :payment, null: false
      t.integer :rate_type, null: false, default: 0
      t.integer :borrowing_form, null: false, default: 0
      t.integer :bought_place, null: false, default: 0
      t.text :reason, null: false
      t.timestamps
    end
  end
end
