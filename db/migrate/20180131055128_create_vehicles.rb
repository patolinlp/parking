class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :patente
      t.references :vehicle_type, foreign_key: true
      t.string :description
      t.string :phone

      t.timestamps
    end
  end
end
