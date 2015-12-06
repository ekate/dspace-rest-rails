class LoginController < ApplicationController

  skip_before_filter :check_token

  def new
  end

  def create
    session[:dspace_rest_token] = DspaceObject.perform_login(params[:user], params[:password])
    redirect_to session[:original_url]
  end

  def index
    redirect_to login_new_url
  end
end
