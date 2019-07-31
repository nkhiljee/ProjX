class Team < ApplicationRecord
    has_many :projects
    has_many :user_teams
    has_many :users, through: :user_teams


<<<<<<< HEAD
    def num_projects
        self.projects.length
=======
    def slug
        letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        result_slug = ""
        self[:name].split("").each do |c|
            if  letters.include?(c)
                result_slug = result_slug+c.downcase
            elsif c == " "
                result_slug = result_slug+"-"
            else 
                result_slug = result_slug+c
            end
        end
        result_slug
    end

    def self.find_by_slug(s_find)
        Team.all.find do |team| 
            team.slug == s_find
        end
>>>>>>> master
    end

    def num_posts
        posts = 0
        self.user_teams.each do |userTeam|
            userTeam.posts.each do |post|
                posts +=1
            end
        end
        posts
    end

    def num_users
        users = 0
        self.user_teams.each do |userTeam|
            userTeam.user
            users +=1
        end
        users
        byebug
    end

    def num_posts_per_day
        # count the number of posts each team has per day
    end
end
