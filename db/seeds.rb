require 'open-uri'

# Clear existing data
Dancer.destroy_all
Producer.destroy_all
User.destroy_all

# Create users
user1 = User.create!(email: "quentin.tarantino@example.com", password: "password", role: "producer")
user2 = User.create!(email: "sofia.coppola@example.com", password: "password", role: "producer")
user3 = User.create!(email: "martin.scorsese@example.com", password: "password", role: "producer")
user4 = User.create!(email: "greta.gerwig@example.com", password: "password", role: "producer")
user5 = User.create!(email: "steven.spielberg@example.com", password: "password", role: "producer")
user6 = User.create!(email: "michael.jackson@example.com", password: "password", role: "dancer")
user7 = User.create!(email: "beyonce.knowles@example.com", password: "password", role: "dancer")
user8 = User.create!(email: "fred.astaire@example.com", password: "password", role: "dancer")
user9 = User.create!(email: "ginger.rogers@example.com", password: "password", role: "dancer")
user10 = User.create!(email: "martha.graham@example.com", password: "password", role: "dancer")

# Create producers with profile pictures
producer1 = Producer.create!(
  name: "Quentin Tarantino",
  bio: "Award-winning director and producer.",
  user: user1
)
producer1.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/men/1.jpg'), filename: 'quentin.jpg')

producer2 = Producer.create!(
  name: "Sofia Coppola",
  bio: "Renowned filmmaker and screenwriter.",
  user: user2
)
producer2.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/women/1.jpg'), filename: 'sofia.jpg')

producer3 = Producer.create!(
  name: "Martin Scorsese",
  bio: "Legendary director known for his classic films.",
  user: user3
)
producer3.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/men/2.jpg'), filename: 'martin.jpg')

producer4 = Producer.create!(
  name: "Greta Gerwig",
  bio: "Actress and director known for her unique storytelling.",
  user: user4
)
producer4.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/women/2.jpg'), filename: 'greta.jpg')

producer5 = Producer.create!(
  name: "Steven Spielberg",
  bio: "Iconic director and producer with numerous accolades.",
  user: user5
)
producer5.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/men/3.jpg'), filename: 'steven.jpg')

# Create dancers with profile pictures
dancer1 = Dancer.create!(
  name: "Michael Jackson",
  age: 50,
  location: "Los Angeles, CA",
  bio: "King of Pop and legendary dancer.",
  user: user6
)
dancer1.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/men/4.jpg'), filename: 'michael.jpg')

dancer2 = Dancer.create!(
  name: "Beyonce Knowles",
  age: 39,
  location: "Houston, TX",
  bio: "Queen Bey and an incredible performer.",
  user: user7
)
dancer2.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/women/3.jpg'), filename: 'beyonce.jpg')

dancer3 = Dancer.create!(
  name: "Fred Astaire",
  age: 88,
  location: "Omaha, NE",
  bio: "Legendary dancer and actor from the golden age of Hollywood.",
  user: user8
)
dancer3.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/men/5.jpg'), filename: 'fred.jpg')

dancer4 = Dancer.create!(
  name: "Ginger Rogers",
  age: 83,
  location: "Independence, MO",
  bio: "Iconic dancer and actress, partner of Fred Astaire.",
  user: user9
)
dancer4.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/women/4.jpg'), filename: 'ginger.jpg')

dancer5 = Dancer.create!(
  name: "Martha Graham",
  age: 96,
  location: "Pittsburgh, PA",
  bio: "Pioneer of modern dance and influential choreographer.",
  user: user10
)
dancer5.profile_picture.attach(io: URI.open('https://randomuser.me/api/portraits/women/5.jpg'), filename: 'martha.jpg')

puts "Seed data created successfully!"
