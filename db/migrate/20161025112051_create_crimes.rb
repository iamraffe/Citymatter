class CreateCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :crimes do |t|
      t.integer :incident_report_number, limit: 8
      t.string :crime_type
      t.datetime :date
      t.integer :time
      t.string :location_type
      t.timestamps
    end
  end
end
