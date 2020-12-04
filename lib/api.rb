class Selector::API

    POKE_GENS = [
        [151, 0],
        [100, 151],
        [135, 251],
        [107, 386],
        [493, 493],
        [156, 720],
        [88, 721],
        [89, 809]
    ]
    
    def initialize(gen)
        selection = POKE_GENS[gen.to_i - 1]
        @url = "https://pokeapi.co/api/v2/pokemon?limit=#{selection[0]}&offset=#{selection[1]}"     
    end

    def get_urls
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        pokemons = info["results"]
        pokemons.each { |poke_info|
            get_poke_info(poke_info["url"])
        }
    end

    def get_poke_info(url)
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        Selector::Pokemon.new(info)
    end


end

# Selector::API.new(2).get_urls
#  binding.pry
