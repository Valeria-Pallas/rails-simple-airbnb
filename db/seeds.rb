# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Borra todos los registros de la tabla Flat antes de crear nuevos registros.
Flat.destroy_all

# Crea 4 apartamentos de ejemplo.
4.times do |i|
  Flat.create(
    name: "Apartamento #{i + 1}",
    address: "Dirección #{i + 1}",
    description: "Descripción del apartamento #{i + 1}",
    price_per_night: rand(50..200), # Precio por noche aleatorio entre 50 y 200.
    number_of_guests: rand(1..5)    # Número de huéspedes aleatorio entre 1 y 5.
  )
end

puts "Se han creado 4 apartamentos de ejemplo."
