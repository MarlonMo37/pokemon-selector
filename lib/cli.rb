class Selector::CLI

    def run
        puts "Hello, welcome to the amazing world of Pokemon!!"
        sleep 1.80
        start
    end

    def start
        puts "What generation of Pokemon would you like to explore?? Choose between generations 1-8"
        input = gets.strip.to_i
        if (1..8).include?(input) == false
            puts "Sorry, but that generation of Pokemon doesn't exist, please enter a valid generation between 1-8"
            start
        else 
            puts "Great choice, please wait while we search for the Pokemon..."
            Selector::API.new(input).get_urls
            list_poke
            puts "Here is the list of Pokemon that belong to that generation, now type the number of the Pokemon you would like to know more about"
        end
        chosen_info
    end

    def chosen_info
        input = gets.strip.to_i
        if input < 0 || input > Selector::Pokemon.all.length
            puts "Sorry, but thats not a valid option, please choose one of the numbers diplayed"
            chosen_info
        else
            self.print_all_info(input)
            puts ""
            continue
        end
    end
    
    def continue
        puts ""
        puts "Would you like to learn about another Pokemon? Enter Y or N"
        input = gets.strip.to_s
        if input.capitalize == "Y"
            start
        elsif input.capitalize == "N"
            puts "Ok, thank you for letting me join you on your journey!!"
        else
            puts "Sorry, but I dont understand your answer"
            continue
        end
    end

    def list_poke
        Selector::Pokemon.all.each.with_index(1) do |poke, index|
        name_2 = poke.name
        puts "#{index}. #{name_2.capitalize}"
        sleep 0.20
        end 
    end

    def print_name(input)
        poke_name = Selector::Pokemon.select_poke(input).name
        puts "Name: #{poke_name.capitalize}"
    end

    def print_types(input)
        print "Type: "
        poke_types = Selector::Pokemon.select_poke(input).types
        poke_types.each do |index|
            print "#{index["type"]["name"].capitalize} "
        end
    end

    def print_abilities(input)
        # puts "Abilities: "
        poke_abilities = Selector::Pokemon.select_poke(input).abilities
        ability_1 = poke_abilities[0]["ability"]["name"].capitalize
        if poke_abilities.length > 1
            ability_2 = poke_abilities[1]["ability"]["name"].capitalize
        end
        if poke_abilities.length == 3
            puts "Abilities: #{ability_1}, #{ability_2}, #{poke_abilities[2]["ability"]["name"].capitalize}(Hidden Ability)"
        elsif poke_abilities.length == 2 && poke_abilities[1]["is_hidden"] == true
            puts "Abilities: #{ability_1}, #{ability_2}(Hidden Ability)"
        elsif poke_abilities.length == 2
            puts "Abilities: #{ability_1}, #{ability_2}"
        else 
            puts "Abilities: #{ability_1}"    
        end      
    end

    def print_stats(input)
        puts "Base stats: "
        poke_stats = Selector::Pokemon.select_poke(input).stats
        poke_stats.each do |stat|
            stat_amount = stat["base_stat"]
            stat_name = stat["stat"]["name"].upcase
            print "#{stat_name}. #{stat_amount}   "
        end
    end

    def print_height(input)
       puts "Height: "
       poke_height = Selector::Pokemon.select_poke(input).height
       meter_height = poke_height.to_s.split("").insert(-2, ".").join
       print "#{meter_height}m"
    end

    def print_weight(input)
        puts "Weight: "
        poke_weight = Selector::Pokemon.select_poke(input).weight
        kg_weight = poke_weight.to_s.split("").insert(-2, ".").join
        print "#{kg_weight}kg"
    end

    def print_all_info(input)
        puts ""
        sleep 1.20
        self.print_name(input)
        puts ""
        sleep 1.20
        self.print_types(input)
        puts ""
        puts ""
        sleep 1.20
        self.print_abilities(input)
        puts ""
        sleep 1.20
        self.print_stats(input)
        puts ""
        puts ""
        sleep 1.20
        self.print_height(input)
        puts ""
        puts ""
        sleep 1.20
        self.print_weight(input)
        sleep 1.20
    end
end




