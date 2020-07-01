class VisitsController < ApplicationController
    def index
        if logged_in?
            visits = current_user.visits
            render :json => visits.as_json(:except => [:created_at, :updated_at])
        else
            render :json => {
                errors: "You need to log in to view this"
            }
        end
    end
end
