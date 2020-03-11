class Match

    # area is competion include id and name
    attr_accessor :id, :competition, :status
    @@all =[]


    def initialize(id,competion,status)
        @id =id 
        @competion = competion 
        @status = status 
        @@all << self if !@@all.include?(self)

    end

    def self.all
        @@all 
    end

    def self.delete 
        @@all.clear 
    end

    def self.display
        @@all.each do |match|
            puts "ID: #{match.id}"
            puts "Competition: #{match.competition}"
            puts "Status: #{match.status}"
            puts ""
        end
    end

    def self.checkID(test_id)
        test_id = test_id.to_i
        flag=false 
        @@all.each do |match|
            if match.id == test_id
                flag=true
            end
        end
        
        flag
    end


end