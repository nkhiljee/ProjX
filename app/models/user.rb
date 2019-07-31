class User < ApplicationRecord
    has_many :user_teams
    has_many :teams, through: :user_teams
    has_secure_password
    validates :name, :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :username, format: { with: /\A[a-z0-9]+\z/, message: "only allows lowercase" }

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

    # counts the amount of posts a user has
    def num_posts
<<<<<<< HEAD
        posts = 0k
        self.user_teams.each do |userTeam|
            userTeam.posts.each do |post|
                posts += 1
            end
        end
        byebug
        posts 
=======
        posts = 0
        self.user_teams.each do |userTeam|
            userTeam.posts.each do |post|
                posts +=1
            end
        end
        posts
    end 

    def num_teams
        teams = 0
        self.user_teams.each do |userTeam|
            userTeam.team
            teams +=1
        end
        teams
>>>>>>> master
    end


    def num_posts_per_day
        # count the number of posts each user has per day
    end

end
