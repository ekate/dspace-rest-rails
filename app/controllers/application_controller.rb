class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'json'
  require 'rest_client'

  $baseRestURL = "http://kb.osu.edu/rest"

  def url_append(endpoint, baseURL)

    finalURL = baseURL + "/" + endpoint
    return finalURL

  end

end
