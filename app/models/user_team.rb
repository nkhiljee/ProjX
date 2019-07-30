class UserTeam < ApplicationRecord
    belongs_to :user
    belongs_to :team
    has_many :posts

    def team_name
        self.team.name
    end
end
