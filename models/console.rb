require('pry-byebug')
require_relative('album')
require_relative('artist')

artist1 = Artist.new({'name' => 'MisterWives'})
artist2 = Artist.new({'name' => 'The Courteeners'})

album1 = Album.new({'title' => 'Our own house', 'genre' => 'Indie', 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'St. Jude', 'genre' => 'Rock', 'artist_id' => artist2.id})


binding.pry

nil