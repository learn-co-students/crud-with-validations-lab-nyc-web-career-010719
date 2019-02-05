puts "Addings songs"


Song.create(title: "Poetic Justice", released: true, release_year: 2012, artist_name: "Kendric Lamar", genre: "Hip-Hop")
Song.create(title: "My Hero", released: true, release_year: 1997, artist_name: "Foo Fighters", genre: "Alternative")
Song.create(title: "Man in the Mirror", released: true, release_year: 1987, artist_name: "Michael Jackson", genre: "Pop")
Song.create(title: "Bad Bad News", released: true, release_year: 2018, artist_name: "Leon Bridges", genre: "R&B")
Song.create(title: "Dreams", released: true, release_year: 1977, artist_name: "Fleetwood Mac", genre: "Rock")
Song.create(title: "Raise Your Weapon", released: false, release_year: nil, artist_name: "deadmau5", genre: "Techno")


puts "Songs added"
