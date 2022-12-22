class ProfileController < ApplicationController
    def index
        if user_signed_in?
            @email = current_user.email
            @public_key =  current_user.public_key
        end
    end
end
