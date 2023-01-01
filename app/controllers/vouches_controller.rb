class VouchesController < ApplicationController
    def index
        @vouches = User.find(params[:user_id]).vouches
    end
end
