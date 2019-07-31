class Team < ApplicationRecord
    has_many :projects
    has_many :user_teams
    has_many :users, through: :user_teams


    def num_projects
        self.projects.length
    end

    def num_posts
        # count the number of posts each team has
    end

    def num_posts_per_day
        # count the number of posts each team has per day
    end
end
