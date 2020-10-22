class CreateAttributeBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :attribute_banks do |t|
      t.integer :attribute_post_id, null: false
      t.integer :bank_post_id, null: false
      t.timestamps
    end
  end
end
