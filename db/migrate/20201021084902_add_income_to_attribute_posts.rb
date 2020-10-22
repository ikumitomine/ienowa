class AddIncomeToAttributePosts < ActiveRecord::Migration[5.2]
  def change
    add_column :attribute_posts, :income, :integer
  end
end
