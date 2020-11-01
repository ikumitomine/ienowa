class DefaultAddToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :is_active, from: "", to: true
  end
end
