module Authorization
  extend ActiveSupport::Concern

  included do
    before_filter :check_authorization
  end

  private

  def check_authorization
    unless authorized?
      redirect_to_login_page
    end
  end

  # Checks if the request is authorized to display the page. This method can
  # be customized to check for user roles, for example.
  def authorized?
    current_user.logged_in?
  end

  # The user is redirected to the login page and the return_to parameter is
  # set, so that the user returns to the originally requested page after
  # a successfull login.
  def redirect_to_login_page
    query_params = request.query_parameters
    query_params.merge!(return_to: request.path)

    target = cms_path(Homepage.default.login_page, query_params)

    redirect_to(target, alert: "This page is protected. You either don't have neccessary access rights or you are not logged in.")
  end
end
