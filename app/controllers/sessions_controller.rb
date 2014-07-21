class SessionsController < ApplicationController
    def new
    end

    def create
      auth = request.env["omniauth.auth"]
      user =  User.find_by_provider_and_uid(auth["provider"], auth["uid"])
      if user == nil 
        user = User.create_with_omniauth(auth)
        session[:user_id] = user.id
        info = auth["info"]
        user.picture = info["image"]
        user.save
        member = Member.new
        user.member = member
        fullName = info["name"].split
        user.member.first_name = fullName[0]
        user.member.last_name = fullName[1]
        user.member.date_of_birth = " "
        user.member.number_of_bets = 0
        user.member.bets_won = 0
        user.member.active = true
        user.save
      end 
      session[:user_id] = user.id
      info = auth["info"]
      user.picture = info["image"]
      user.save
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
