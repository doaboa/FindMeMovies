###-------NOTES
# Allow you to set who you are- "hipster (obscure movies)" "drinker (shitty movie)" 
# sandboxtweeter
# adding users and class


#-----GEMS and APIs

require 'ruby-tmdb'
require 'Twitter'

Tmdb.api_key = ENV["TMDB_API"]
Tmdb.default_language = "en"

Twitter.configure do |config|
  config.consumer_key = "xyFDXpv7wQ2oTgXnru2Lw"
  config.consumer_secret = ENV["TW_CS"]
  config.oauth_token = "1548563346-WoE2Vq8te0mUpgViEmG1z5LUQTF0Kp7y8wjVOJ4"
  config.oauth_token_secret = ENV["TW_OTS"]
end


#------Arrays

@movie_genres = {"Action" => 28, "Adventure" => 12, "Animation" => 16, "Comedy" => 35, "Crime" => 80, "Disaster" => 105, "Documentary" => 99, "Drama" => 18, "Eastern" => 82, "Fantasy" => 14, "History" => 36, "Holiday" => 10595, "Horror" => 27, "Music" => 10402, "Musical" => 22, "Mystery" => 9648, "RoadMovie" => 115, "Science Fiction" => 878, "Short" => 10749, "Sport" => 9805, "Suspense" => 10748, "Thriller" => 53, "Western" => 37}


#-------Class

# class User
#  attr_accessor :name, :twitter_handle

# #-----Output Starts

# puts "If you are an existing user, please type your name.  Otherwise, type new."
# userornot = gets.chomp

# if userornot == 'new'
# 	self.initialize
# else
	
# end

#-------Methods

def execute
	puts "Hey stranger!  What's your name?"
	@name = gets.chomp.capitalize
	puts "Cool, #{@name}, what's your twitter handle?"
	@twitter_handle = gets.chomp
end

def byebye
	puts "Hope you found a movie to watch, bye #{@name}!"
end

def get_movie_list
puts "Alrighty, what movie genre do you feeling like watching today?  Either type the genre, or type 'list' to get a list of all genres."

@answer = gets.chomp.capitalize

if @answer == 'List'
	puts "-----------------------"
	puts @movie_genres.keys
	puts "-----------------------"
	puts "Now pick your genre."
	@genre = gets.chomp.capitalize
elsif @movie_genres.include?(@answer)
else
	until @movie_genres.include?(@answer)
		puts "-----------------------"
		puts @movie_genres.keys
		puts "-----------------------"
		puts "You fail.  Look at the list and pick again."
		@answer = gets.chomp.capitalize
	end
end
	
@genre = @answer		
@genre_id = @movie_genres[@genre]

puts "How many movies would you like me to pull from this genre?"
@number = gets.chomp

#-------Pulling from API

@results = {}
@results = TmdbMovie.browse(:order_by => "rating", :order => "desc", :genres => @genre_id, :min_votes => 50, :page => 1, :per_page => @number, :language => "en", :expand_results => false)

puts "-------------------" 
@results.each do |result|
	puts result.name
end
puts "-------------------" 

	def tweeting
		puts "Type 'tweet' if you would like to have this list tweeted to you.  Type 'more' if you would like to get another list. Type 'exit' if you're done!"
		tweetornot = gets.chomp.capitalize

		if tweetornot == 'Tweet'
			Twitter.update("#{@twitter_handle} #{@results}")
			elsif tweetornot == 'More'
				get_movie_list
			elsif tweetornot == 'Exit'
				byebye
			else
				puts "Sorry, you've typed something incorrect.  Try again."
				tweeting
		end
	end

tweeting

end


#-----Output Starts

execute
get_movie_list

# end

#--------References

#http://api.themoviedb.org/2.1/methods/Movie.browse
#http://rubydoc.info/gems/ruby-tmdb/0.2.1/frames