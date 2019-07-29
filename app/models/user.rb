class User < ApplicationRecord
    has_many :teams
    has_many :teams, through: :userteams

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
        User.all.find do |user| 
            user.slug == s_find
        end
    end

end
