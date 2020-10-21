class CreateAttributePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :attribute_posts do |t|
      t.integer :user_id, null: false
      t.integer :age, null: false
      t.integer :sex, null: false, default: 0
      t.integer :family_form, null: false, default: 0
      t.integer :employment_status, null: false, default: 0
      t.integer :length_job, null: false, default: 0
      t.integer :listed, null: false, default: 0
      t.timestamps
    end
  end
end
