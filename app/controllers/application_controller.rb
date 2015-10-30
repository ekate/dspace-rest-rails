class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'json'
  require 'active_rest_client'





  $base_rest_url = 'https://trydspace.longsight.com/rest'
  #$base_rest_url = 'http://localhost:8080/rest'

  def url_append(endpoint, base_url)
    #base_url=Rails.application.config.api_server_url

   #final_url = "#{base_url}/#{endpoint}?expand=all"


  end

  def get_json

    raw_json = RestClient.get $endpoint, { :accept => :json}
    $json_node = JSON.parse(raw_json)

  end

  def parse(object)

    #$json_node.each do |key, value|
     # unless key == 'expand'
      #  object["#{key}"] = value
      #end
    #end
    object.each do |json_node |
    data = JSON.parse(json_node)

    data['data']['children'].each do |child|
      puts child['data']['body']
    end

      end

  end

end

