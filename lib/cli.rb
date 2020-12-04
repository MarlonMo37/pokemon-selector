class Selector::CLI

    def run
        puts "Hello, welcome to the amazing world of Pokemon!!"
        puts "What genaration of Pokemon would you like to explore?? Choose between generations 1-8"
        start
    end

    def start
        input = gets.strip.to_i
        if (1..8).include?(input) == false
            puts "Sorry, but that generation of Pokemon doesn't exist, please enter a valid generation between 1-8"
            start
        else 
            Selector::API.new(input).get_urls
            puts "Great choice. Here is the list of Pokemon that belong to that generation."
            list_poke
        end
        chosen_info
    end

    def chosen_info
        input = gets.strip.to_i
    def 
    

    def list_poke
        Selector::Pokemon.all.each.with_index(1) do |poke, index|
        name_2 = poke.name
        puts "#{index}. #{name_2.capitalize}"
        end 
    end

    def print_name(input)
        poke_name = Selector::Pokemon.select_poke(input).name
        "Name: #{poke_name.capitalize}"
    end

    def print_types(input)
        print "Type: "
        poke_types = Selector::Pokemon.select_poke(input).types
        poke_types.each do |index|
            print "#{index["type"]["name"].capitalize} "
        end
    end

    def print_abilities(input)
        print "Abilities: "
        poke_abilities = Selector::Pokemon.select_poke(input).abilities
        ability_1 = poke_abilities[0]["ability"]["name"].capitalize
        ability_2 = poke_abilities[1]["ability"]["name"].capitalize
        if poke_abilities.length == 3
            print "#{ability_1}, #{ability_2}, #{poke_abilities[2]["ability"]["name"].capitalize}(Hidden Ability)"
        elsif poke_abilities.length == 2 && poke_abilities[1]["is_hidden"] == true
            print "#{ability_1}, #{ability_2}(Hidden Ability)"
        elsif poke_abilities.length == 2
            print "#{ability_1}, #{ability_2}"
        else 
            print "#{ability_1}"    
        end        
    end

    def print_stats(input)
        print "Base stats: "
        poke_stats = Selector::Pokemon.select_poke(input).stats
        poke_stats.each do |stat|
            stat_amount = stat["base_stat"]
            stat_name = stat["stat"]["name"].upcase
            print "#{stat_name}. #{stat_amount}   "
        end
    end

    def print_height(input)
       print "Height: "
       poke_height = Selector::Pokemon.select_poke(input).height
       meter_height = poke_height.to_s.split("").insert(-2, ".").join
       print "#{meter_height}m"
    end

    def print_weight(input)
        print "Weight: "
        poke_weight = Selector::Pokemon.select_poke(input).weight
        kg_weight = poke_weight.to_s.split("").insert(-2, ".").join
        print "#{kg_weight}kg"
    end

end



