
DspaceRestRuby::Application.configure do
  config.api_server_url = "https://localhost:8443/rest"
  #config.api_server_url ="https://trydspace.longsight.com/rest"

  ActiveRestClient::Base.faraday_config do |faraday|
    faraday.adapter(:net_http)
    faraday.ssl.verify_mode =  false
    faraday.options.timeout       = 10
    faraday.headers['User-Agent'] = "ActiveRestClient/#{ActiveRestClient::VERSION}"
  end


end

# app/models/person.rb
class Community < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url


  before_request do |name, request|
    if(request.url.include?('login'))
      request.post_params = { "email" =>"dspace@test", "password"=>"dspace"}
    end
    request.body = request.post_params.to_json
    request.headers["Content-Type"] = "application/json"
    if(request.url.include?('communities'))
      #request.headers["rest-dspace-token"]=self.login
      if(name.to_s=="save")
        request.post_params = { "shortDescription"=>'testCollection' }
        request.body = request.post_params.to_json
      else
        request.post_params = { "name" =>"new"}
        request.post_params = { "shortDescription"=>"testCollection"}
        request.body = request.post_params.to_json
      end
    end
  end



  get :all, "/communities/top-communities"
  get :find, "/communities/"
  post :login , "/login/",  plain: true
  put :save, "/communities/:id"
  post :create, "/communities"


end
