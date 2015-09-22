class SessionsController < ApplicationController

  def create
    #binding.pry
    user = User.find_by(email:
                          params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
       redirect_to users_profile_path
    else
       redirect_to '/login'
    end
￼￼end

  def destroy
    session.clear
    redirect_to '/login'
  end

  def guest_create
    #binding.pry
    guest = Guest.find_by(hassh:
                          params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
       session[:user_id] = user.id
       redirect_to users_profile_path
    else
       redirect_to '/login'
    end
￼￼end




end
