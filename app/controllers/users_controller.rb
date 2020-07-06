class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user, serializer: UserSerializer
        else
            render :json => {
                error: user.errors.full_messages.to_sentence
            }
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
