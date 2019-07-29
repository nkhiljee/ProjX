class User < ApplicationRecord
    has_many :teams
    has_many :teams, through: :userteams

    attr_accessor :name

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(s_find)
        User.all.find{|user| user.slug == s_find}
    end

end
