class User < ApplicationRecord
    has_many :teams, through: :userteams
end
