require 'rubygems'
require 'ruby-tmdb'

Tmdb.api_key = "6e837186b09388ff716901a70d300f61"
Tmdb.default_language = "en"




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
	@genre = @answer

end

@genre_id = @movie_genres[@genre]

#PLAY WITH THIS!!

TmdbMovie.browse(:order_by => "rating", :order => "desc", :genres => @genre_id, :min_votes => 5, :page => 1, :per_page => 10, :language => "en", :expand_results => true)
  

  
def self.browse(options)
  options = {
    :expand_results => false
  }.merge(options)
  
  expand_results = options.delete(:expand_results)
  language = options.delete(:language)
  
  results = []
  results << Tmdb.api_call("Movie.browse", options, language)
  
  results.flatten!
  results.compact!
  
  results.map!{|m| TmdbMovie.new(m, expand_results, language) }
  
  if(results.length == 1)
    return results[0]
  else
    return results
  end
  
end


#http://api.themoviedb.org/2.1/methods/Genres.getList
#http://api.themoviedb.org/2.1/methods/Movie.browse
#http://rubydoc.info/gems/ruby-tmdb/0.2.1/frames