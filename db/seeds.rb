# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attendance.destroy_all
Event.destroy_all
User.destroy_all

cities = ["Paris", "Rennes", "Nantes", "Bordeaux", "Tours", "Toulouse", "Montpellier", "Strasbourg", "Marseille", "Lille"]

5.times do 
	User.create!(
		email: Faker::Name.first_name + "@yopmail.com",
    encrypted_password: "abcdefghijkl123456",
    description: Faker::Movies::Lebowski.quote + "\n" * 3,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
		)
end

5.times do
	Event.create!(
		start_date: Faker::Date.between(from: Date.today + 2.days, to: Date.today + 60.days),
    duration: rand(1..60) * 5,
    title: Faker::Quote.most_interesting_man_in_the_world,
    description: "1234567890123456789012",
    price: rand(1..1000),
    location: cities[rand(1..9)],
    administrator: User.all.sample
    )
end

n = 0
5.times do
	Attendance.create!(
	event: Event.find(Event.first.id + n),
	attendee: User.find(User.first.id + n)
		)
	n += 1
end
n = 0
5.times do
	Attendance.create!(
	event: Event.find(Event.first.id + n),
	attendee: User.find(User.last.id - n)
		)
	n += 1
end