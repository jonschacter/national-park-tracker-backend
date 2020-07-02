class ParksController < ApplicationController
    def index
            parks = Park.all
            render json: parks.as_json(:include => {
                :images => { :except => [:created_at, :updated_at] },
                :addresses => { :except => [:created_at, :updated_at] }
            }, :except => [:created_at, :updated_at])
            
    end
end