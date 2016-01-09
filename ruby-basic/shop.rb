class Shop
    @@count = 0

    def initialize(name)
        @name = name
    end
    

    
    def print_details
        puts "shop: #{name}"
    end
    
end


class Petshop < Shop
    attr_accessor :animals
    
    def print_details
    super
    print_animals
    end

    def print_animals
    puts "animals: #{animals.join(',')}"
    end
end
