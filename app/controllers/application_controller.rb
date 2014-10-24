class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :detect_edit_mode

  def detect_edit_mode
    @in_edit_mode = params[:_scrivito_display_mode] == "editing"
  end

end
