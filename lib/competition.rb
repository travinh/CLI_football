class Competition

    # area is hash
    attr_accessor :id, :name, :area
    @@all =[]


    def initialize(id,name,area)
        @id =id 
        @name = name 
        @area = area 
        @@all << self if !@@all.include?(self)

    end

    def self.all
        @@all 
    end

    def self.delete 
        @@all.clear 
    end

    def self.display
        @@all.each do |competition|
            puts "ID: #{competition.id}"
            puts "Name: #{competition.name}"
            puts "Area ID: #{competition.area[:id]}"
            puts "Area Name: #{competition.area[:name]}"
            puts "Area Country Code: #{competition.area[:countryCode]}"
            
            puts "Area URL: #{competition.area[:ensignUrl] == nil ? "None" : competition.area[:ensignUrl]}"
            # puts "Area: #{competition.area}"
            



            puts ""
        end
    end

    def self.checkID(test_id)
        test_id = test_id.to_i
        flag=false 
        @@all.each do |competition|
            if competition.id == test_id
                flag=true
            end
        end
        
        flag
    end


end