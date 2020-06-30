class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:session][:username])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            render json: user.as_json(:except => [:password_digest, :created_at, :updated_at])
        else
            render :json => {
                error: "Incorrect Username or Password"
            }
        end
    end

    def show
        user = User.find_by(id: session[:user_id])

        if user
            render json: user.as_json(:except => [:password_digest, :created_at, :updated_at])
        else
            render :json => {
                error: "User is not logged in"
            }
        end
    end

    def destroy
        session.clear
        render json: {
            notice: "User logged out"
        }
    end
end