require 'open-uri'

# Clear existing data
Dancer.destroy_all
Producer.destroy_all
User.destroy_all
Casting.destroy_all

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

# Create castings with specific details
casting1 = Casting.create!(
  title: "Broadway Musical Extravaganza",
  description: "Seeking talented dancers for an upcoming Broadway musical. All styles welcome!",
  dancing_style: "Musical Theatre",
  deadline: Date.today + 30.days,
  location: "New York, NY",
  producer: producer1
)
casting1.photo.attach(io: URI.open('https://randomuser.me/api/portraits/men/1.jpg'), filename: 'broadway.jpg')

casting2 = Casting.create!(
  title: "Contemporary Dance Performance",
  description: "Looking for contemporary dancers for a modern dance piece exploring themes of nature and technology.",
  dancing_style: "Contemporary",
  deadline: Date.today + 45.days,
  location: "Los Angeles, CA",
  producer: producer2
)
casting2.photo.attach(io: URI.open('https://randomuser.me/api/portraits/women/1.jpg'), filename: 'contemporary.jpg')

casting3 = Casting.create!(
  title: "Hip Hop Music Video",
  description: "Casting energetic hip hop dancers for an upcoming music video shoot.",
  dancing_style: "Hip Hop",
  deadline: Date.today + 15.days,
  location: "Atlanta, GA",
  producer: producer3
)
casting3.photo.attach(io: URI.open('https://randomuser.me/api/portraits/men/2.jpg'), filename: 'hiphop.jpg')

casting4 = Casting.create!(
  title: "Ballet Company Auditions",
  description: "Prestigious ballet company seeking new members for the upcoming season.",
  dancing_style: "Ballet",
  deadline: Date.today + 60.days,
  location: "Chicago, IL",
  producer: producer4
)
casting4.photo.attach(io: URI.open('https://randomuser.me/api/portraits/women/2.jpg'), filename: 'ballet.jpg')

casting5 = Casting.create!(
  title: "Salsa Dance Competition",
  description: "Calling all salsa dancers! Join our exciting dance competition and showcase your skills.",
  dancing_style: "Salsa",
  deadline: Date.today + 20.days,
  location: "Miami, FL",
  producer: producer5
)
casting5.photo.attach(io: URI.open('https://randomuser.me/api/portraits/men/3.jpg'), filename: 'salsa.jpg')

puts "#{Dancer.count} dancers created"
puts "#{Producer.count} producers created"
puts "#{Casting.count} castings created"
puts "Seed data created successfully!"
