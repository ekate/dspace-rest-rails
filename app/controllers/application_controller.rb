class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'json'
  require 'rest_client'

  $base_rest_url = 'http://kb.osu.edu/rest'

  def url_append(endpoint, base_url)

    final_url = "#{base_url}/#{endpoint}"

  end

end
