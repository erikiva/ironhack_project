module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  # def current_guest
  #   @current_guest ||= Guest.find_by(access_hash: session[:guest_hash])
  # end

end
