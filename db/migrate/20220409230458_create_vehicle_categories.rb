class CreateVehicleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_categories do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
