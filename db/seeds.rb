# The data can be loaded with the rails db:seed command (or created alongside the database with db:setup)
require 'open-uri'

# Clean up database prior to seeding
print 'cleaning up database - '
Dog.destroy_all
User.destroy_all
Reservation.destroy_all
puts 'done!'

# Seed users
print 'Seeding users - '
user1 = User.create!(user_name:"John", password: "123456", email: "a@a.a")
user2 = User.create!(user_name:"Bob", password: "123456", email: "b@b.b")
puts 'done!'

# Seed dogs
print 'Seeding dogs -  '
dogs = [
  {
    name: 'Lenny',
    breed: 'Golden Retriever',
    energy: 3,
    affection: 5,
    size: 3,
    hypoallergenic: false,
    description: "The Golden Retriever, an exuberant Scottish gundog of great beauty, stands among America's most popular dog breeds.
                  They are serious workers at hunting and field work, as guides for the blind, and in search-and-rescue, enjoy obedience
                   and other competitive events, and have an endearing love of life when not at work. The Golden Retriever is a sturdy,
                   muscular dog of medium size, famous for the dense, lustrous coat of gold that gives the breed its name.",
    address: '345, Rue Le Moyne O, Longueuil',
    latitude: 45.530284248104536,
    longitude: -73.5011570102674
  },
  {
    name: 'bob',
    breed: 'pug',
    energy: 2,
    affection: 4,
    size: 1,
    hypoallergenic: false,
    description: "Once the mischievous companion of Chinese emperors, and later the mascot of Holland's royal House of Orange, the small
                  but solid Pug is today adored by his millions of fans around the world. Pugs live to love and to be loved in return.
                  The Pug's motto is the Latin phrase 'multum in parvo' (a lot in a little)'¿an apt description of this small but muscular
                  breed. They come in three colors: silver or apricot-fawn with a black face mask, or all black.",
    address: '320, Rue de Bretagne, Longueuil',
    latitude: 45.54221627425791,
    longitude: -73.50069909612768
  },
  {
    name: 'Kira',
    breed: 'Bernese Mountain Dog',
    energy: 2,
    affection: 5,
    size: 5,
    hypoallergenic: false,
    description: "Big, powerful, and built for hard work, the Bernese Mountain Dog is also strikingly beautiful and blessed with a sweet,
                  affectionate nature. Berners are generally placid but are always up for a romp with the owner, whom they live to please.
                  The Bernese Mountain Dog is a large, sturdy worker who can stand over 27 inches at the shoulder. The thick, silky, and
                  moderately long coat is tricolored: jet black, clear white, and rust.",
    address: "1418, Avenue Desjardins, Montreal",
    latitude: 45.54937762173261,
    longitude: -73.53552396172968
  },
  {
    name: 'Maurice',
    breed: 'Poodle',
    energy: 4,
    affection: 5,
    size: 2,
    hypoallergenic: true,
    description: "Whether Standard, Miniature, or Toy, and either black, white, or apricot, the Poodle stands proudly among dogdom¿s true
                  aristocrats. Beneath the curly, low-allergen coat is an elegant athlete and companion for all reasons and seasons. Poodles
                   come in three size varieties: Standards should be more than 15 inches tall at the shoulder; Miniatures are 15 inches or under;
                   Toys stand no more than 10 inches. All three varieties have the same build and proportions.",
    address: "907, Rue des Hérons, Longueuil",
    latitude: 45.55262895336608,
    longitude: -73.48189696753761
  },
  {
    name: 'Taco',
    breed: 'French Bulldog',
    energy: 3,
    affection: 5,
    size: 2,
    hypoallergenic: false,
    description: "The one-of-a-kind French Bulldog, with his large bat ears and even disposition, is one of the world's most popular small-dog breeds,
                  especially among city dwellers. The Frenchie is playful, alert, adaptable, and completely irresistible. The French Bulldog resembles
                  a Bulldog in miniature, except for the large, erect 'bat ears' that are the breed's trademark feature. The head is large and square,
                  with heavy wrinkles rolled above the extremely short nose.",
    address: "517, Rue des Alouettes, Longueuil",
    latitude: 45.55809424971951,
    longitude: -73.48425965723058
  },
  {
    name: 'Whisky',
    breed: 'Alaskan Malamute',
    energy: 4,
    affection: 4,
    size: 5,
    hypoallergenic: false,
    description: "An immensely strong, heavy-duty worker of spitz type, the Alaskan Malamute is an affectionate, loyal, and playful but dignified dog
                   recognizable by his well-furred plumed tail carried over the back, erect ears, and substantial bone. The Alaskan Malamute stands 23
                   to 25 inches at the shoulder and weighs 75 to 85 pounds.",
    address: "1428, Rue Labrie, Longueuil",
    latitude: 45.56129816137321,
    longitude: -73.48736452646988
  },
  {
    name: 'Mika',
    breed: 'Newfoundland',
    energy: 1,
    affection: 4,
    size: 5,
    hypoallergenic: false,
    description: "The massive Newfoundland is a strikingly large, powerful working dog of heavy bone and dignified bearing. The sweet-tempered Newfie is
                   a famously good companion and has earned a reputation as a patient and watchful 'nanny dog' for kids. A male Newfoundland can weigh
                  up to 150 pounds and stand 28 inches at the shoulder; females typically go 100 to 120 pounds. The Newf head is majestic, the expression
                  soft and soulful. The outer coat is flat and coarse.",
    address: "191, Rue du Caribou, Longueuil",
    latitude: 45.554509816324895,
    longitude: -73.46312166858843
  },
  {
    name: 'Pebbles',
    breed: 'Bichon Frise',
    energy: 4,
    affection: 5,
    size: 1,
    hypoallergenic: true,
    description: "The small but sturdy and resilient Bichon Frise stands among the world's great 'personality dogs.' Since antiquity, these irresistible canine
                   comedians have relied on charm, beauty, and intelligence to weather history's ups and downs. A good-size Bichon will stand a shade under a
                  foot tall at the shoulder. The breed's glory is a white hypoallergenic coat, plush and velvety to the touch, featuring rounded head hair that
                   sets off the large, dark eyes and black leathers of the nose and lips",
    address: "557, Rue Montcalm, Longueuil",
    latitude: 45.53555992660554,
    longitude: -73.47643301029015
  },
  {
    name: 'Peanut',
    breed: 'Hokkaido',
    energy: 4,
    affection: 5,
    size: 3,
    hypoallergenic: false,
    description: "The Hokkaido is a medium-sized, strongly-built dog. They have longer, thicker coats than the other Japanese breeds, and also have wider chests
                   and smaller ears. Like all the Nihon Ken, they have a double coat made up of protective, coarse outer guard hairs, and a fine, thick undercoat
                  that is shed seasonally. The breed comes in several colors: white, red, black, brindle, sesame, and wolf grey. With early training, the Hokkaido
                  is a very loyal and dedicated companion who wants to please his human family.",
    address: "1536, Boulevard Quinn, Longueuil",
    latitude: 45.52566866009399,
    longitude: -73.49091342632177
  },
  {
    name: 'Eddie',
    breed: 'Pekingese',
    energy: 1,
    affection: 5,
    size: 1,
    hypoallergenic: false,
    description: "The Pekingese, a compact toy companion of regal bearing and a distinctive rolling gait, is one of several breeds created for the ruling classes
                  of ancient China. These are sophisticated dogs of undying loyalty and many subtle delights. Pekingese are compact, stocky toy dogs weighing up to
                   14 pounds. The coat is longest at the neck and shoulders, giving Pekes their famous 'lion's mane.'",
    address: "309, Avenue Berkley, Saint-Lambert",
    latitude: 45.51246674435933,
    longitude: -73.5085015143829
  }
]

dogs.each_with_index do |dog, index|
  print "\b#{index}"
  i = Dog.new(dog)
  i.save!

end







# name: dog[:name],
# breed: dog[:breed],
# energy: dog[:energy],
# affection: dog[:affection],
# size: dog[:size],
# hypoallergenic: dog[:hypoallergenic],
# description: dog[:description],
# address: dog[:address],
# latitude: dog[:latitude],
# longitude: dog[longitu]
