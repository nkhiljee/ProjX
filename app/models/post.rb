class Post < ApplicationRecord
    belongs_to :user_team

    validates :user_team_id, :title, :description, presence: true

end
