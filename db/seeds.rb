# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def create_users(number)
  users = []
  number.times {|n| users << User.create(
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "test1234",
                    password_confirmation: "test1234")}
  users
end

def create_events(number, user)
  events = []
  number.times {|n| events << Event.create(name: "#{Faker::Name.name} and #{Faker::Name.name}",
                    user_id: user.id,
                    event_date: Date.today + Faker::Number.number(2).to_i.days)}
  events
end

def create_sections(number, event)
  sections = []
  number.times {|n| sections << Section.create( event_id: event.id,
                    title: Faker::Lorem.sentence(2),
                    content: Faker::Lorem.paragraph(10)
                    )}
  puts event.id
  sections
end

def create_guests(number, event)
  guests = []
  number.times {|n| guests << Guest.create( event_id: event.id,
                    email: 'nataliav@gmail.com',
                    access_hash: Faker::Lorem.characters(30)
                    )}
  puts event.id
  guests
end



users = create_users(20)

my_user = User.create(name: "natalia",
                  email: "nataliav@gmail.com",
                  password: "test1234",
                  password_confirmation: "test1234"
                  )

users << my_user
users.each{|user| create_events(3, user)}
events = Event.all

sections = events.each{|event| create_sections(3, event)}

guests = events.each{|event| create_guests(10, event)}
