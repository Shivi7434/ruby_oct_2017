class LikesController < ApplicationController
    
    def create
        secret = Secret.find(params[:id])

        Like.create(user: current_user, secret: secret) unless secret.users.include? current_user


        # [<User id:1>, <User id:2>].include? current_user <User id:1>

        return redirect_to '/secrets'
    end

    def destroy
        secret = Secret.find(params[:id])

        like = Like.find_by(secret: secret, user: current_user)
        
        like.delete unless like === nil

        return redirect_to '/secrets'
    end
end