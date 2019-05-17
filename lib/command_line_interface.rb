def welcome
  puts "Welcome! I can show you all the Star Wars movies a character is in."
end

def character_list
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].map do |character|
    { name: "#{character["name"]}", value: "#{character["name"]}" }
  end

end

def prompt_select_character_from_user
  prompt = TTY::Prompt.new
  prompt.select("Select a character:", (character_list))
end