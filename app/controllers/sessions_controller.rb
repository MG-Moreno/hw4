class SessionsController < ApplicationController
  def new
  end

  def create
    #authenticate the user
    #1 find user by unique identifier
    @user = User.find_by({"email" => params["email"]})    
    #2 if user exists -> check password
    if @user
    #3 if password CORRECT -> log in successful
      if BCrypt::Password.new(@user["password"])==params["password"]   
        flash["notice"]="Welcome."
        cookies["user_id"] = @user["id"]
        redirect_to "/places"
      else
        redirect_to "/login"  
      end
    else
    #4 if password INCORRECT -> login fails
      redirect_to "/login"
    end
  end

  def destroy
    #log out user
    cookies["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  