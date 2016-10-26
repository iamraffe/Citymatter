class AddCategoryToCrime < ActiveRecord::Migration[5.0]
  def change
    add_column :crimes, :category, :string
  end
end
