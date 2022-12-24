class ProfileController < ApplicationController
    def index
        if user_signed_in?
            @email = current_user.email
            @public_key =  current_user.public_key
            @accounts = current_user.accounts.all
        end
    end
end
