class Selector::Pokemon

    @@all = []

    def initialize(info)
        info.each do |k, v|
            self.class.attr_accessor k
            self.send("#{k}=", v)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end

    def self.select_poke(input)
        Selector::Pokemon.all[input.to_i - 1]
    end

end

