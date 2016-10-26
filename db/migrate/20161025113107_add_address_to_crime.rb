class AddAddressToCrime < ActiveRecord::Migration[5.0]
  def change
    add_column :crimes, :address, :string
  end
end
