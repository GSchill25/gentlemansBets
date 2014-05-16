class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by_username(params[:username])
      if user && User.authenticate(params[:username], params[:password])
        session[:user_id] = user.id
        if user.role? :admin
          redirect_to bets_path, notice: "You are logged into Gentleman's Bets"
        else
          redirect_to bets_path, notice: "You are logged into Gentleman's Bets"
        end
      else
        flash.now.alert = "Username or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to bets_path, notice: "Logged out!"
    end
end
