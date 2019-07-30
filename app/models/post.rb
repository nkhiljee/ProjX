class Post < ApplicationRecord
    belongs_to :user_team

    def ut_names
        @hash = {}
        @arr = []
        UserTeam.all.each do |ut|
            @hash[:key] = ut.team_id
        end
        Team.all.each do |team|
            @hash[:value] = team.name
        end
        @arr << @hash
        @arr
    end
    
end
