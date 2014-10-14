module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method(:current_user)
  end

  def current_user
    @current_user ||= if session[:user]
      User.new
    else
      NullUser.new
    end
  end

  private

  def logged_in?
    current_user.logged_in?
  end

  def current_user=(user)
    user ||= NullUser.new

    @current_user = user
    session[:user] = user.id
    EditModeDetection.editing_allowed(session, user.admin?)
  end
end
