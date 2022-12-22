class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        user_id = params[:id]
        @user = User.find(user_id)
        @vouches = @user.vouches.all
    end
end
