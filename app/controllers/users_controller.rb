class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
  end

  def profile
    @user = current_user
    #@user.events.build
    #render 'users/profile'
  end

  def create
    # BCrypt::Password.create("my password").gsub(/\//, '')
    #Faker::Lorem.characters(10) #=> "ang9cbhoa8"
  end

  def show
  end

  def events
    @user = User.first
  end

end
