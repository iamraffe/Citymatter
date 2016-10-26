class AddNeighborhoodToCrime < ActiveRecord::Migration[5.0]
  def change
    add_column :crimes, :neighborhood, :string
  end
end
