class DspaceObject< ActiveRestClient::Base
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  attr_accessor :base_url, :dspace_token

  def self.base_url
    Rails.application.config.api_server_url
  end

  def self.dspace_token(dspace_token)
    @dspace_token=dspace_token
  end

  post :login , "/login/",  plain: true


  authorization_required=["save","create","destroy"]

  def self.perform_login(user, password)
    @email=user
    @password=password
    self.dspace_token(self.login)
  end

  before_request do |name, request|
    if(name.to_s=="login")
      request.post_params = { "email" =>@email, "password"=>@password}
    else
      request.headers["rest-dspace-token"]=@dspace_token if  authorization_required.include?(name.to_s)
    end
    request.headers["Content-Type"] = "application/json"
    request.body = request.post_params.to_json
  end


end
