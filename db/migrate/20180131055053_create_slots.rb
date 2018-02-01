class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.string :number
      t.references :vehicle_type, foreign_key: true

      t.timestamps
    end
  end
end
