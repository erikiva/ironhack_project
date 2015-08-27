class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  unless Rails.env.development?
    protect_from_forgery with: :exception
  end

  before_action :set_locale

  def set_locale
    if cookies[:planner_locale] && I18n.available_locales.include?(cookies[:planner_locale].to_sym)
      l = cookies[:planner_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:planner_locale] = l
    end
    I18n.locale = l
  end

  helper_method :current_guest
    def current_guest
      if @current_guest.nil?
        @current_guest = Guest.find_by(access_hash: session[:guest_hash])
      end
    @current_guest
end

end
