class Team < ApplicationRecord
    has_many :projects
    has_many :user_teams
    has_many :users, through: :user_teams


    def slug
        letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        result_slug = ""
        self[:username].split("").each do |c|
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
    end
end
