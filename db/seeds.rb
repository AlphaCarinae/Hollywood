# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Movie seeds
Movie.destroy_all
m1 = Movie.create(title: "Ocean's Eleven", year: 2001)
m2 = Movie.create(title: "The Ides of March", year: 2011)
m3 = Movie.create(title: "The Curious Case of Benjamin Button", year: 2008)
m4 = Movie.create(title: "Se7en", year: 1995)

#Actor seeds
Actor.destroy_all
a1 = Actor.create(name: "George Clooney")
a2 = Actor.create(name: "Brad Pitt")
a3 = Actor.create(name: "Julia Roberts")
a4 = Actor.create(name: "Paul Giamatti")
a5 = Actor.create(name: "Cate Blanchett")
a6 = Actor.create(name: "Morgan Freeman")



#Director seeds
Director.destroy_all
d1 = Director.create(name: "Steven Soderbergh")
d2 = Director.create(name: "David Fincher")
d3 = Director.create(name: "George Clooney")
#List seeds
List.destroy_all
l1 = List.create(name: "Good Movies")
l2 = List.create(name: "Great Movies")


#association seeds

m1.actors << a1 << a2 << a3
m2.actors << a4 << a1
m3.actors << a2 << a5
m4.actors << a2 << a6


d1.movies << m1
d2.movies << m4 << m3
d3.movies << m2

m1.lists << l1
m2.lists << l1
m3.lists << l2
m4.lists << l2
