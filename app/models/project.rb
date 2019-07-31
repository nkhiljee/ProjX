class Project < ApplicationRecord
    belongs_to :team

    def total_project_days
        start_date = Date.parse(self.start)
        finish_date = Date.parse(self.finish)
        days_between = (finish_date - start_date).to_i
    end

    def days_left_for_project
        @current_day = Date.today
        finish_date = Date.parse(self.finish)
        # byebug
        days_left = (finish_date - @current_day).to_i
        if days_left > 0
            days_left
        else
            "Project has ended"
        end
    end

    
end
