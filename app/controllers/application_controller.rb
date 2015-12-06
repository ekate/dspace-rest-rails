class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'json'
  require 'active_rest_client'

  #$base_rest_url = 'https://trydspace.longsight.com/rest'
  #$base_rest_url = 'http://localhost:8080/rest'
  helper :all             # include all helpers, all the time

  protect_from_forgery    # See ActionController::RequestForgeryProtection for details

  before_filter :check_token, :except => [:index, :show]

  def url_append(endpoint, base_url)
    base_url=Rails.application.config.api_server_url
  end



  def parse(object)
    object.each do |json_node|
      data = JSON.parse(json_node)

      data['data']['children'].each do |child|
        puts child['data']['body']
      end

    end

  end

  protected

  def check_token
    unless session[:dspace_rest_token]
      session[:original_url] = request.url
      redirect_to :controller => :login, :action => :new
    end
  end

end


