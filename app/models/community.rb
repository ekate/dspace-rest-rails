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



  get :all, "/communities/"
  get :top, "/communities/top-communities"
  get :find, "/communities/:id"
  get :collections, "/communities/:id/collections"
  get :subcommunities, "/communities/:id/communities"
  post :login , "/login/",  plain: true
  put :save, "/communities/:id"
  post :create, "/communities"


end
