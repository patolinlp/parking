class CreateReserves < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|
      t.references :slot, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.datetime :initTime
      t.datetime :exitTime
      t.integer :totalTime
      t.integer :price
      t.boolean :busy, default: false

      t.timestamps
    end
  end
end
