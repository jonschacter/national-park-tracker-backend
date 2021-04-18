class ReviewsController < ApplicationController
    def index
        if park = Park.find_by(id: params[:park_id])
            reviews = Review.all.select{|review| review.park == park}
            render json: reviews, each_serializer: ReviewSerializer
        elsif visit = Visit.find_by(id: params[:visit_id])
            if visit.review
                render json: visit.review, serializer: ReviewSerializer
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
            render json: review, serializer: ReviewSerializer
        else
            render :json => {
                error: review.errors.full_messages.to_sentence
            }
        end
    end

    def update
        review = Review.find_by(id: params[:id])
        if review
            if review.update(review_params)
                render json: review, serializer: ReviewSerializer
            else
                render :json => {
                    error: review.errors.full_messages.to_sentence
                }
            end
        else
            render :json => {
                error: "Review could not be found"
            }
        end
    end

    def destroy
        review = Review.find_by(id: params[:id])
        if review
            review.destroy
            if review.user == current_user
                render :json => {
                    notice: "Review successfully deleted"
                }
            else
                render :json => {
                    error: "You are not authorized to delete this review"
                }
            end
        else
            render :json => {
                error: "Review could not be found"
            }
        end
    end

    private

    def review_params
        params.require(:review).permit(:visit_id, :content)
    end
end