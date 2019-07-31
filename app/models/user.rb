class User < ApplicationRecord
    has_many :user_teams
    has_many :teams, through: :user_teams
    has_secure_password
    validates :name, :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

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

    def num_posts
        posts = 0
        # user = User.find(session[:user_id])
    end

    def num_posts_per_day
        # count the number of posts each user has per day
    end

end
