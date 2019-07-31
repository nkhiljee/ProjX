class Team < ApplicationRecord
    has_many :projects
    has_many :user_teams
    has_many :users, through: :user_teams


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

    end

    def next_project_due
        @team = self
        @team.projects.each_with_index do |project, index|
            if @team.projects[1]
                if project.days_left_for_project > @team.projects[index+1].days_left_for_project 
                    @dueProject = @team.projects[index+1]
                    byebug
                else
                    @dueProject = project
                end
            else
                @dueProject = project
            end
        end
        @dueProject.name
    end
    
end
