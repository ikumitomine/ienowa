class DefaultRestrictFromLoans < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :loans, :bought_place, from: 0, to: nil
  end
end
