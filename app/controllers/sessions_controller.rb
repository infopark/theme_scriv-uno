class SessionsController < ApplicationController

  def create
    logger.warn "\nLogin attempt with Login name '#{params[:login]}'"
    if valid_credentials?(params[:login], params[:password])
      session[:user] = params[:login]
      logger.warn "successfull.\n"
      redirect_to scrivito_path(Obj.find(params[:showing_obj]))
    else
      logger.warn "NOT successfull!\n"
      flash[:alert] = "LOGIN: The credentials you provided are invalid"
      redirect_to scrivito_path(Obj.find(params[:showing_obj]))
    end
  end

  def destroy
    logger.warn "Logging out user '#{session[:user]}'."
    session[:user] = nil 
    redirect_to scrivito_path(Obj.homepage)
  end


  private

  def valid_credentials?(login, password)
    login == 'demo' && password == ENV['SCRIVITO_PW']
  end

end
