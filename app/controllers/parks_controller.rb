class ParksController < ApplicationController
    def index
        parks = Park.all
        render :json => parks, each_serializer: ParkSerializer     
    end
end