class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'json'
  require 'rest_client'

  #$base_rest_url = 'http://kb.osu.edu/rest'
  $base_rest_url = 'http://localhost:8080/rest'

  #endpoint should include slashes
  def url_append(endpoint, query_params = nil)
    $base_rest_url + endpoint + (query_params || '?expand=all')
  end

  def get_json

    raw_json = RestClient.get $endpoint, { :accept => :json}
    $json_node = JSON.parse(raw_json)

  end

  def parse(object)

    $json_node.each do |key, value|
      if (key != 'expand') and (key != 'context')
        object["#{key}"] = value
      end
    end

  end

end
