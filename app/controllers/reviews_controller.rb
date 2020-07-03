class ReviewsController < ApplicationController
    def index
        if park = Park.find_by(id: params[:park_id])
            reviews = Review.all.select{|review| review.park == park}
            render json: reviews.as_json(:include => {
                :user => {
                    :only => [:id, :username]
                }
            }, except: [:created_at])
        elsif visit = Visit.find_by(id: params[:visit_id])
            if visit.review
                render json: visit.review.as_json(:include => {
                    :user => {
                        :only => [:id, :username]
                    }
                }, except: [:created_at])
            else
                render :json => {
                    notice: "This visit does not yet have a review"
                }
            end
        else
            render :json => {
                error: "Could not be found"
            }
        end
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: review.as_json(:include => {
                :user => {
                    :only => [:id, :username]
                }
            }, except: [:created_at])
        else
            render :json => {
                error: review.errors.full_messages.to_sentence
            }
        end
    end

    private

    def review_params
        params.require(:review).permit(:visit_id, :content)
    end
end