require_relative "football_api"
require_relative "competition"
require_relative "match"


require 'pry'

class FootballController
    
    def menu 
        puts ""
        puts "Welcome to football world!"
        puts "1. To list all of the competitions, enter 'list competitions'."
        puts "2. To list all of the matches, enter 'list matches'."
        puts "3. To quit, type 'exit'."
    end

    def subMenu_Competition
        puts ""
        puts "***********Competition Menu *************"
        puts "1. To see more detail about a competition, please enter the ID of the competition."
        puts "2. To go back to main menu, type 'exit'."
    end

    def subMenu_Match
        puts ""
        puts "***********Competition Menu *************"
        puts "1. To see more detail about a match, please enter the ID of the match."
        puts "2. To go back to main menu, type 'exit'."
    end

    def call 
        football = Football_API.new()
        menu
        input = gets.chomp 

        while input != "exit"
            if input == "list competitions"
                football.getCompetitions
                Competition.display
                # binding.pry
                puts "-----------------------------------"
                subMenu_Competition
                input2 = gets.chomp
                while input2 != "exit"
                    if Competition.checkID(input2)
                        input2 = input2.to_i
                        football.getInfoCompetition(input2)
                        subMenu_Competition
                        input2 = gets.chomp
                    else 
                        puts "**** Please type the right ID ****"
                        subMenu_Competition
                        input2 = gets.chomp
                    end
                end
                menu
                input = gets.chomp  
            elsif input == "list matches"
                football.getMatches
                Match.display
                puts "-----------------------------------"
                subMenu_Match
                input3 =gets.chomp 
                while input3 != "exit"
                    if Match.checkID(input3)
                        input3 = input3.to_i
                        football.getInfoMatch(input3)
                        subMenu_Match
                        input3 =gets.chomp
                    else 
                        puts "**** Please type the right ID ****"
                        subMenu_Match
                        input3 =gets.chomp
                    end
                end
                menu
                input = gets.chomp  
            else
                menu
                input = gets.chomp 
            end
        end

        
    
    end

end

FootballController.new.call