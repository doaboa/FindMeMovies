require 'rubygems'
require 'ruby-tmdb'

@movie_genres = {"Action" => 28, "Adventure" => 12, "Animation" => 16, "Comedy" => 35, "Crime" => 80, "Disaster" => 105, "Documentary" => 99, "Drama" => 18, "Eastern" => 82, "Fantasy" => 14, "History" => 36, "Holiday" => 10595, "Horror" => 27, "Music" => 10402, "Musical" => 22, "Mystery" => 9648, "Road Movie" => 115, "Science Fiction" => 878, "Short" => 10749, "Sport" => 9805, "Suspense" => 10748, "Thriller" => 53, "Western" => 37}

puts "Hi!  What movie genre do you feeling like watching today?  Either type the genre, or type 'list' to get a list of all genres."

@answer = gets.chomp

if @answer == 'list'

puts "-----------------------"
 puts @movie_genres.keys
 puts "-----------------------"
puts "Now pick your genre."
@genre = gets.chomp

else
  

  end


#http://api.themoviedb.org/2.1/methods/Genres.getList
#https://www.themoviedb.org/talk/51c8742a760ee33f08101f52
#http://api.themoviedb.org/2.1/methods/Movie.browse
#http://rubydoc.info/gems/ruby-tmdb/0.2.1/frames