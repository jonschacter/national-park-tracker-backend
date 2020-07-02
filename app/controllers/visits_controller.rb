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

    def update
        visit = Visit.find_by(id: params[:id])
        if visit
            if visit.update(visit_params)
                render :json => visit.as_json(:except => [:created_at, :updated_at])
            else
                render :json => {
                    error: visit.error.full_messages.to_sentence
                }
            end
        else
            render :json => {
                error: "Visit could not be found"
            }
        end
    end

    def destroy
        visit = Visit.find_by(id: params[:id])
        if visit
            visit.destroy
            if visit.user == current_user
                render :json => {
                    notice: "Visit successfully deleted"
                }
            else
                render :json => {
                    error: "You are not authorized to delete this visit"
                }
            end
        else
            render :json => {
                error: "Visit could not be found"
            }
        end
    end

    private

    def visit_params
        params.require(:visit).permit(:user_id, :start_date, :end_date, :park_code)
    end
end
