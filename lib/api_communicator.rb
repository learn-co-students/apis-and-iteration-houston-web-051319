require 'rest-client'
require 'json'
require 'pry'

def get_character_info(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  character_info= response_hash["results"].find do |character_name|
    character_name["name"] == character
  end
end

def get_character_movies_from_api(character_name)
  movie_urls = get_character_info(character_name)["films"]

  movies = movie_urls.map do |each_url|
    string = RestClient.get(each_url)
    JSON.parse(string)
  end

end

def print_movies(films)
  films.each_with_index.map do |movie,index|
    puts "#{index+1}. #{movie["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  puts "Here are the films that character is in:"
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
