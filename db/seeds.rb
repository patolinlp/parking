# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vehicle_type_list = [
    "Automóvil",
    "Camioneta",
    "Moto",
    "Camión"
]

vehicle_type_list.each do |name|
	VehicleType.create(name: name)
end

slot_list = [
	["A-1",1],
	["A-2",1],
	["B-1",2]
]

slot_list.each do |number, vehicle_type|
	Slot.create(number: number, vehicle_type_id: vehicle_type)
end