class AddKanaToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :name_hira, :string
  end
end
