class SessionsController < ApplicationController
    def new
    end

    def create
      auth = request.env["omniauth.auth"]
      user =  User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to members_path, :notice => "Signed in!"
    end

    def destroy
      session[:user_id] = nil
      redirect_to members_path, :notice => "Signed out!"
    end

    '''
    def create
      user = User.find_by_username(params[:username])
      if user && User.authenticate(params[:username], params[:password])
        session[:user_id] = user.id
        if user.role? :admin
          redirect_to bets_path, notice: You are logged into Gentlemans Bets
        else
          redirect_to bets_path, notice: You are logged into Gentlemans Bets
        end
      else
        flash.now.alert = "Username or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to bets_path, notice: "Logged out!"
    end'''
end
