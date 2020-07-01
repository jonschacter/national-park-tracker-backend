class VisitsController < ApplicationController
    def index
        if logged_in?
            visits = current_user.visits
            render :json => visits.as_json(:except => [:created_at, :updated_at])
        else
            render :json => {
                error: "You need to log in to view this"
            }
        end
    end

    def create
        visit = Visit.new(visit_params)

        if visit.save
            render :json => visit.as_json(:except => [:created_at, :updated_at])
        else
            render :json => {
                error: visit.errors.full_messages.to_sentence
            }
        end
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :start_date, :end_date, :park_code)
    end
end
