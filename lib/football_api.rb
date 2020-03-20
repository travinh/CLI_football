require "pry"


require_relative "competition"
require_relative "match"
require "rest-client"
require "json"

class Football_API

    attr_accessor :football_url

    def initialize
        @football_url = "http://api.football-data.org/"
    end

    def getCompetitions
        # get competitions
        
        resp = RestClient.get(football_url + "v2/competitions/", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'})
        competitions = JSON.parse(resp.body, symbolize_names:true)
        competitions_array = competitions[:competitions] 
        competitions_array.each do |competition|
            Competition.new(competition[:id].to_i, competition[:name], competition[:area])
        end
        competitions_array
    end

    def getMatches
        #get matches 
        resp = RestClient.get(football_url + "v2/matches/", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'})
        matches = JSON.parse(resp.body, symbolize_names:true)
        matches_array = matches[:matches]
       
        matches_array.each do |match|
           
            temp = Match.new(match[:id].to_i, match[:competition][:name], match[:status])
            
        end
    end
    

    def getInfoCompetition(id)

        resp = RestClient.get(football_url + "/v2/competitions/#{id}", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'}){|response, request, result| response }
        

        if resp.code == 200 
        #if RestClient.get(football_url + "/v2/competitions/#{id}", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'})
            competition = JSON.parse(resp.body, symbolize_names:true)
            
            
            puts "ID: #{competition[:id]}"

            puts "Name: #{competition[:name]}"
           
            puts "Code: #{competition[:code]}"
   
            puts "Start Date: #{competition[:currentSeason][:startDate]}"
        
            puts "End Date: #{competition[:currentSeason][:endDate]}"
         
            puts "Area: #{competition[:area][:name]}"
            
            puts "Winner: #{competition[:currentSeason][:winner][:name]}"
            
            
        else 
            puts "Sorry for the inconvenience, you could not see more detail of this ID due to membership policy. Thank you! "
        end
        

    end

    def getInfoMatch(id)

        resp = RestClient.get(football_url + "/v2/matches/#{id}", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'}){|response, request, result| response }
        
      
        if resp.code == 200 
        #if RestClient.get(football_url + "/v2/competitions/#{id}", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'})
            match = JSON.parse(resp.body, symbolize_names:true)
            
            puts "Match ID: #{match[:match][:id]}"
            puts "League: #{match[:match][:competition][:name]}"
            puts "Home team: #{match[:head2head][:homeTeam][:name]}"
            puts "Away team: #{match[:head2head][:awayTeam][:name]}"
            puts "Status: #{match[:match][:status]}"

        else
            puts "Sorry for the inconvenience, you could not see more detail of this ID due to membership policy. Thank you! "
        end
        

    end


end




#  matches_array = JSON.parse(RestClient.get(football_url+ "v2/matches", headers={'X-Auth-Token':'3747fe64f691481bb8ca8ed0877cb761'}).body, symbolize_names:true)


