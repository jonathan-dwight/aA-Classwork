# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cat1 = Cat.create({name: 'Boba', color: 'naranja', birth_date: '2015/04/11', description: 'Bubbly', sex: 'F'})
cat2 = Cat.create({name: 'Mochi', color: 'azul', birth_date: '2017/7/13', description: 'Chewy', sex: 'M'})
cat3 = Cat.create({name: 'Sashimi', color: 'dorado', birth_date: '2020/04/11', description: 'Lil Kitten', sex: 'F'})