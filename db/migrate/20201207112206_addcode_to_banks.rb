class AddcodeToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :code, :integer
  end
end
