# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
more_categories = [ 
	{ name: 'Materiais compostos', description: 'concretos e argamassas' },
	{ name: 'Materiais ceramicos', description: 'telhas, pisos e azulejos' },
	{ name: 'Residuos perigosos', description: 'tintas e solventes' }
]

more_categories.each do |cat|
	Category.create!(cat)
end
