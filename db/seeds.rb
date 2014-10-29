User.destroy_all
Nonprofit.destroy_all
Gift.destroy_all


pj = User.create(first_name: "PJ", last_name: "Hughes", email: "pj@ga.co", phone: "(855) 288-0881", user_type: "company", password: "thisisfake")
phil = User.create(first_name: "Phil", last_name: "Lamplaugh", email: "philco@ga.co", phone: "(855) 288-0881", user_type: "individual", password: "bullpassword")
travis = User.create(first_name: "Travis", last_name: "Vander Hoop", email: "trav@ga.co", phone: "(855) 288-0881", user_type: "individual", password: "notrealatall")
ryan = User.create(first_name: "Ryan", last_name: "Parks", email: "rnparks@gmail.com", phone: "(917) 750-2397", user_type: "company", password: "12345")
andy = User.create(first_name: "Andy", last_name: "Fritzy", email: "andy@ga.co", phone: "555-5555-5555", user_type: "company", password: "thisisfake")
ade = User.create(first_name: "Ade", last_name: "SomethingCrazy", email: "ade@ga.com", phone: "(855) 288-0881", user_type: "individual", password: "bullpassword")
dewey = User.create(first_name: "Dewey", last_name: "Hall", email: "dewey@ga.co", phone: "(855) 288-0881", user_type: "individual", password: "notrealatall")
jared = User.create(first_name: "Jared", last_name: "Norcott", email: "jared@gmail.com", phone: "(555) 555-5555", user_type: "company", password: "12345")

pj_nonprofit = Nonprofit.create(user_id: 1, address: "123 Fake Street", description: "We are a fake nonprofit agency looking to help people donate gifts.", business_name: "Fake Agency Inc." )
phil_nonprofit = Nonprofit.create(user_id: 2, address: "345 Notastreet Avenue", description: "We are a church looking to help out needy kids.", business_name: "Church of Chipotle")
travis_nonprofit = Nonprofit.create(user_id:3, address: "789 Whatchmacallit Street", description: "We don't even know what we do.", business_name: "WeDontKnow Corp.")
ryan_nonprofit = Nonprofit.create(user_id:3, address: "17th Street Between 10th and 11th", description: "We are a tech company looking to help out some kids", business_name: "Tech Brothers Corp")
andy_nonprofit = Nonprofit.create(user_id: 4, address: "123 Fake Street", description: "We are a fake nonprofit agency looking to help people donate gifts.", business_name: "Fake Agency Inc." )
ade_nonprofit = Nonprofit.create(user_id: 5, address: "345 Notastreet Avenue", description: "We are a church looking to help out needy kids.", business_name: "Church of Chipotle")
dewey_nonprofit = Nonprofit.create(user_id: 6, address: "789 Whatchmacallit Street", description: "We don't even know what we do.", business_name: "WeDontKnow Corp.")
jared_nonprofit = Nonprofit.create(user_id: 7, address: "17th Street Between 10th and 11th", description: "We are a tech company looking to help out some kids", business_name: "Tech Brothers Corp")

pj_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Boy Age 13", gift_type: "Socks")
phil_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Boy Age 9", gift_type: "Shoes")
travis_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Girl Age 15", gift_type: "Video Games")
ryan_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Boy Age 12", gift_type: "Tonka Truck")
andy_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Boy Age 19", gift_type: "A GA Class")
ade_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Girl Age 5", gift_type: "Candy")
dewey_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Girl Age 17", gift_type: "A diary")
jared_gift = Gift.create(nonprofit_id: "#{rand(1..100).to_s}", body: "Boy Age 11", gift_type: "Toy Racecar")

pj_gift.nonprofit = pj_nonprofit
phil_gift.nonprofit = phil_nonprofit
travis_gift.nonprofit = travis_nonprofit
ryan_gift.nonprofit = ryan_nonprofit
andy_gift.nonprofit = andy_nonprofit
ade_gift.nonprofit = ade_nonprofit
dewey_gift.nonprofit = dewey_nonprofit
jared_gift.nonprofit = jared_nonprofit

pj.save
phil.save
travis.save
ryan.save
andy.save
ade.save
dewey.save
jared.save

pj_nonprofit.save
phil_nonprofit.save
travis_nonprofit.save
ryan_nonprofit.save
andy_nonprofit.save
ade_nonprofit.save
dewey_nonprofit.save
jared_nonprofit.save

pj_gift.save
phil_gift.save
travis_gift.save
ryan_gift.save
andy_gift.save
ade_gift.save
dewey_gift.save
jared_gift.save

